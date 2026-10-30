Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387949;
	b=UHA1dTdpjisTcJWtC4PB609FNYX9a1I7oJBml5tp/Rw1Z9ph/v9rZOH/YoM/KwrBYjAr
	 +LssiIDA2vRmZfSPQRjbQBSuqudY4vTzhZVCjCdwQGPr6u3xp9DpkjZASl3gwmutLwbWW
	 qIu+IrKAo2wa5iNb7Y32GQr4kjWP12SL8ULyY0gF0N1K7GOHzHZ+xs7QQvUv94weGRIMO
	 Qn1iR0mHmLW+5KFiU4LFc8gJ4M1m+qfDXsSuIbmOSiybUevhjLAom78vMo9Io9HKRRR2p
	 oxDuMflz9FMvJFZ32gXK/lcwhlVL1JFmaYoAtAT0lUMWIH1me4iSELnoiYrD4v+1HiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WFZOXzn6veCZIAF+JkkHH6W85OOUZkO3tjuMxrK8z4M=;
	b=Hg/dOkNiFUCfvCnS7TPQsAyrtmxaLxf6AkZTfGB1luEZh30Nn81dFt4w+khTsTYhBOsU
	 Byly35ZHt4RrdgkO9Q4H9gJp3IL7wQSPGwf3kjYXArJBm9NtuvCnG2h3nZ+v0A0vNtjb9
	 ccFxye4lsC4Q6Mbx9k1ueISo6ziw1PBecwGjrFKCx37ZgbWtVN7mh66lJk6vhHHdjydMU
	 T4ms0zk0/SR1gUq99PzR8axbYAkU5EPPjgwv9KyjmuhnsLJuq/E0KMepK10AO8IQz+X/z
	 himPFOB8zCnYurAAXCjFqoL7FEJuHkGY6q/OwzDpIkxKdCK8qZ/OhmRrgYTR1o948dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YVBUVFwY;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F73A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=YVBUVFwY
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1455911c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793387948; x=1793992748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WFZOXzn6veCZIAF+JkkHH6W85OOUZkO3tjuMxrK8z4M=;
        b=YVBUVFwYU861XNa9yZBakWSPdsYczLorxxbahbhKanhYEPeNamKNePE7vnOnevVerT
         OS9Gn0qrQuQsAfyOOBJizWic/NYb1l/g+b9m5aD76j/M+YnseHgp3B7GAWW5w1dlF/T2
         6hz9ui6k1ufnndz/n5RkG/MS1LiNBW4sjadw9mATkesW5KvaNlT907WYd85sUZcsXpiK
         GQLvIxQLHHkAZcFpJsYJZ4nAzQQprNe3Z5cs0mBVafY36je167hsfvSo2rH1jMnRsL9D
         3vWBlckdXQtDRQmgZo9IHMtyJT7wuCBdV9iJQk4BrELFDwx8mbWZuZdV84Rw4MhpzIyG
         qwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387948; x=1793992748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFZOXzn6veCZIAF+JkkHH6W85OOUZkO3tjuMxrK8z4M=;
        b=f9hOPneUUVi7OZOzhYQhXFyR2Qj9s0CchPdKwXWBXeSBFjn7fQ9jNNaXMolstkSAsy
         bUs8eOfLwqZztdEUKCpACJvAvV4uiRp5UMm0eOSAnpCo1epk8a4qwHZpfPCSSErvSXwo
         AS09q098hl1qpfl1caa9rBnw33xKlOk1Uc5GbyTO+v+g8wohC2kxDd3So5NWyclr06dA
         wQyCXus/c4XOCFhjo+oGetVteYf7kTCnFloGtHPOxUZMyxDOOInHzf9p5QBpQe0EdE/6
         +Svc8f48/62kor5isPZzAZlBdL6zIvSpszJWqjs8RPY3tvRjvLKM0kmMDlQrZ1iJV4Do
         ntvA==
X-Forwarded-Encrypted: i=1; AKwUvBw5mJ7IdGBEw8eR1t3a58RvAAWTWcDFA5gL6tgnIbEeCvNhB07vYyM3DuiGskU0IqX6eilb9xt+G14Y950=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfCXojzqTToW+qjnWeLiNdFHXAbfXdwIXk0EuZvMABTgjiFqvv
	UXu4PpRLd30yp31ImyRABnUZcAKylEpcnuqMnnTyZH0BBxCbdVEkNJy1kgt5m/z+dX8=
X-Gm-Gg: AYBFou2LFCSphtr3WBroxGxS7U9NMmdoOwOG7ZVxqTBGilS23/Gu4aR/Qw7waAgo1u0
	Dn7nHZQFwJh58U6cg5Pd0fx3dsZFhMRIE8MrW8vomgUNG2/QfrM8J2S4RbcfVVYQw2Is2QTkkGG
	ZdYGF23kXK/Ab1DnmZaYq2ZDsKpoUuB/3WZXtf+HHSEAWUhJ51zPKXwxXBJgkghwpgnoskWfyLy
	rfmFV252uhnrVdpMVAixGPlQwY7cJYH7QBmNMsysDb6BzlrOQLuU8kAdYHwjlMDCvg+36VZxjEA
	qvV8/818MyGeaUotjr5R6ex+A00ZzmSxhU6JBHKPGYb8ZwZb4bamCXxi6UKU7U3XLCVXbz+G7LE
	LAQtmhHD/S+vA4yU1XFyjmnOgTtKNLAx06STvbZkGInfW11c7ZFE8D+LZWLy5QbhXlaqFIlsJFM
	S2xGHwo/29S96FXKdm5FPR6TQuS0GgEkd4/Bqr2z6+T7r07yy9FTnguhKCcVJZndFnkxRv3tYgI
	VpxN7jCdsJ0IM0COYw+3hgxz3Yv0E90q71CBxzREx5Ojl7m+l2W1xZS6EvoDdz3EAl9v1kko47v
	725O6U+JrW7G8SyQFCeKhu9UWuJQ90alqqFmcYnHjM95lVPENt4=
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr3810130c88.37.1793387947237;
        Fri, 30 Oct 2026 12:19:07 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm14623889c88.10.2026.10.30.12.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:19:06 -0700 (PDT)
Date: Fri, 30 Oct 2026 12:19:05 -0700
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
Message-ID: <20261030191905.GC122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-8-mkhalfella@purestorage.com>
 <179242929827.3619480.8550407233438315193.b4-review@b4>
 <20261019212630.GN2931-mkhalfella@purestorage.com>
 <7e73057c-698a-4ce6-b153-3b8b1077f77c@flourine.local>
 <20261021183357.GX2931-mkhalfella@purestorage.com>
 <fe4f3c98-492c-418a-9ff2-b3c6cf5446cf@flourine.local>
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
In-Reply-To: <fe4f3c98-492c-418a-9ff2-b3c6cf5446cf@flourine.local>

On Fri 2026-10-30 11:32:52 +0100, Daniel Wagner wrote:
> On Wed, Oct 21, 2026 at 11:33:57AM -0700, Mohamed Khalfella wrote:
> > Is Documentation/ABI/stable/sysfs-nvme a living history of sysfs-nvme
> > documentation or a documentation for the specific kernel release?
> 
> I understand it documents the sysfs API. sysfs is supposed to be stable,
> so adding a new state is factually a breaking change. The document
> should document the current API the kernel provides.

Looks like changing the "Date" or "KernelVersion" will make it like
"state" attribute has been added new newer kernel. That leaves one place
to mention "fencing" and "fenced" are added in newer kernel.

--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -145,8 +145,9 @@ KernelVersion:      4.11
 Contact:       Sagi Grimberg <sagi@grimberg.me>
 Description:
                Shows the current state of the controller. Possible values:
-               "new", "live", "resetting", "connecting", "deleting",
-               "deleting (no IO)", "dead".
+               "new", "live", "fencing", "fenced", "resetting", "connecting",
+               "deleting", "deleting (no IO)", "dead". "fencing" and "fenced"
+               were added in 7.5.

 What:          /sys/class/nvme/nvmeX/numa_node
 Date:          November 2018


I added this diff to this patch. Let me know if you want me to change
it.
