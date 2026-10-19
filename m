Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445195;
	b=eWQKPj8TgSRVp95qJVSQUiTFP4RJZbG0hKl7D3GkxbrKh2eH1OAoYZq490gcqT6uLp4K
	 U5MjgHMDm2oxoDTJqHpA3ImwCYn+pKcGUFmQGbN9ccovv28lHyCuS7CmIRuwUBKuzmgYk
	 btDnD1LaRH8fs9r/3uf58HF/MJQc27YM+UwN7kmhUE0m6OKQ4aQ1eOkONYcKfYyXOspSq
	 vonSCwdTNUAJwxTwP5tWSUvVMC4MkRXyzNlziMP5qAS57eDF9hzzdycLwHVez4d1622kp
	 8W4iyC9R0ULZTlltrUexIvSVEcdAUuEp55AH9PnQVqyuffjnfkY3C/3S+lEWgE5h2sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3mmxD4Tum6zEy+TUT0Nw2BCCmCp2Q3UZSNxY4R/g864=;
	b=eRBhb1gCIuo1kPxcAfr3nm7t60M030NOS5oMRTDu1yNho+59NZr9PMSWwtoJdjpbDo/4
	 joHi0ke27goy1Muo96IOa5dZgQN/RNVL7i5YNcWXYoA5ev5QmrArXvwIa2zvhiohUEN9C
	 /aDsvs1r8PmU1f+CI3+m2aXeZ1AaFWL+Dq4ji1Y4mwKhsuIkOuzwXwJ8IUSSSDCLIKETQ
	 eMiWUBb7DPjVwnVnRyIihY3rD9tEculcJCfADsc87fuq0VXUq1Qv2b002kQOIz1AbrNJN
	 EvuzV6bqZ/Q8g6c+ySO8RaZZHxBd7xOnPLsMXUTdKmMCGvgZtBPuN/eZM/hFH8jnOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="Di/UeSu1";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33386606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33386606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Di/UeSu1
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso11843875e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792445193; x=1793049993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3mmxD4Tum6zEy+TUT0Nw2BCCmCp2Q3UZSNxY4R/g864=;
        b=Di/UeSu1ToKDZcgYB5Ng5O5IFKFH93VIbxQIhoktiVDKiAt2tIXn9V37XL9zC2AAIo
         4mRRW6NWUP0UQKXJk3mtMDeRTjYwjOfTWSUwCMh5Pk/O+64hAqMW0LGwov9q7A6JO0/o
         O6aG7NYDgPZ5t/4Q/2C6ILFwN6sH2rggD0bpvFzyal/8Q0GzoZyAVVpUqdd6K1Nana+8
         JcHU+nQkhmt9dae+J1u1/8dmArkYLfI4owqywBKBAR8ID65DdBCqYCkgvc/z/JVzFcA8
         jla+lUTyrSggGSSQ62zKJSJl4O1WIs8L3XqkK/td4Pe0d4lfCNvnOhwTqNRyQ6lU4gZC
         OB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445193; x=1793049993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mmxD4Tum6zEy+TUT0Nw2BCCmCp2Q3UZSNxY4R/g864=;
        b=IPUfNalDxfiOf9tr0PnpV9o8sifARtYHjeeqt1w77IayKa61VN75IN4RgggujHVX+h
         wcqgASgs+0cajPbnYYX2twemHnCBU60KTObF+exZd4QAzHCgGswQjWTZMrjHbsWm1xoG
         jdX+btHLH7uz5YUQMVyOYQXboCprFb3ZXRMi/C72vdgG2+WyQ8+gdTNK2heeMo+gVy0x
         sfA6xbPLdtQQp21to6H1cVwTDwfNeUPUV0pOfnvhOUQWwaTZWYgRYZC0AiaPLUw9k9hi
         yGvEOxino0AApT37JgnE3P7Yua6pze96fMKh624OqxJ1t9HYrq7h2qjT9/lpvqdzQD8t
         58QA==
X-Forwarded-Encrypted: i=1; AKwUvBwUM9cg2ox87ai7PQJ1SeWRoPHmZRVDJzP03sWxe5uN9jHsuVV92VXGzWe4cDB7AIVUSqHJSeVGrgsgj8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLElk3DgqutB0IACnfISbBw4zZkkov8e+r8+G/yA8Otlkgr1eG0
	T0unvqZESD/5443rCTJuXvHLzAR1ODBTTVsqwU+UZK1XCPuqHNyqWvrZjgYprh5bNo4=
X-Gm-Gg: AYBFou3p+1Z73ZFwiEdcQiUk1u/Lo+TH2Hdle4n+Elvnkz0vwtZjb6Td7ySHYqGcaNB
	/gciFG74kEXNq6w7b/YI4QwsKFOD3jnqDT9qAYxOu0iDr6sc56ASwewN9kwnfmnsomY/wO03D00
	Vo8I1pUskNwFTuf+veh1HwDqs8+9+YQKCY7HLkuAwbNrR2a+LqFk9xWDfkNV0dlo7pvWBdNP26k
	gY00KatXwr92QV15gXK8zrO69cZGz5/VtoP6dmL6QSPBbIj0kDW9zr47FL9e41Xxj0PcZGM5EKk
	+378dgkZmndb+9zrqHwuvzZE4qAHS/EuOgVLAE0rxSgOd2oqAR8f4um5nCent9BzQ3ffW8KBkfh
	HrwU3VTb87mWkIwxVlxv7Iuj90h/6h9hgAh9v1lc72wwVtPzegqFkiDbOGQ5iMSHR4rW5+lUTTN
	NhNOasPOe7KfuFxBPwgVrdS2Kl9GlLUeztmJHUogKhPb1JWlcyzmFAk/jyzRUxAfkQijB50pPBE
	+pJyOLGAoFaIoaWBwU=
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr211563375e9.19.1792445193470;
        Mon, 19 Oct 2026 14:26:33 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33155fsm216641335e9.4.2026.10.19.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:26:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:26:30 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 07/18] nvme: Introduce FENCING and FENCED controller
 states
Message-ID: <20261019212630.GN2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179242929827.3619480.8550407233438315193.b4-review@b4>

On Mon 2026-10-19 19:01:38 +0200, Daniel Wagner wrote:
> > --- a/drivers/nvme/host/sysfs.c
> > +++ b/drivers/nvme/host/sysfs.c
> > @@ -542,6 +542,8 @@ static ssize_t nvme_sysfs_show_state(struct device *dev,
> >  	static const char *const state_name[] = {
> >  		[NVME_CTRL_NEW]		= "new",
> >  		[NVME_CTRL_LIVE]	= "live",
> > +		[NVME_CTRL_FENCING]	= "fencing",
> > +		[NVME_CTRL_FENCED]	= "fenced",
> >  		[NVME_CTRL_RESETTING]	= "resetting",
> >  		[NVME_CTRL_CONNECTING]	= "connecting",
> >  		[NVME_CTRL_DELETING]	= "deleting",
> 
> The ABI documentation needs to be updated.

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index a2f5d0710db4..c47274fdd9a5 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -140,13 +140,13 @@ Description:
 		PCI transport only.

 What:		/sys/class/nvme/nvmeX/state
-Date:		November 2016
-KernelVersion:	4.11
+Date:		October 2026
+KernelVersion:	7.5
 Contact:	Sagi Grimberg <sagi@grimberg.me>
 Description:
 		Shows the current state of the controller. Possible values:
-		"new", "live", "resetting", "connecting", "deleting",
-		"deleting (no IO)", "dead".
+		"new", "live", "fencing", "fenced", "resetting", "connecting",
+		"deleting", "deleting (no IO)", "dead".

 What:		/sys/class/nvme/nvmeX/numa_node
 Date:		November 2018


How about a diff like the one above? Similar to CIRN and CIU, I am not
sure what to put in "KernelVersion".

What do you think?

> 
> -- 
> Daniel Wagner <wagi@kernel.org>
