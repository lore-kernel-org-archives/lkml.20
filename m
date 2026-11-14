Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=zzrIBz3dkqN86e73sdg/RLzn8YCumxj4gQax8N0lpwZZwHKQKw4AEmV5Z9qi3g/TEQxM
	 sAvGBzwmZd1Bgdphu/6lhPSKzmD1Ul8r8sWc4/5WVHyQEV+h24dvx+umvxrT37ikTnVcb
	 90ZWRAXIVi8vJFuF+u/mw3EbFaT0B1H13v3va7TPMXjZyUMtCCUtT7BWmNtYBqabC6j+q
	 PGsBTowhTLq8jU9Ay+GxL2A9Ft4YFs32YxEGHNeZJkhyFHLf0YRK6qvzCS8u25mtBLlIn
	 7FGiNU70WnasLfY4Ut16EBiu84c3EXIbcTFXLWs9uiptbJq3cFc3kKT8UVDACajEi6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=LmyERNWQBhYle473Ocre+0tsTnWqQFznn/dNJMID/bxcEvy97P0HT+X6tGSfHEOuuFcq
	 S80kPdGjX5BNWggvOIOAxWK8r5QGf7QEKOKm1brYiyXsAVyZc0PsRp8WKW9vaG3pdPHLH
	 prkAvgAK104fl8QjrB2rViDcRSUhh8tTTWyGpF5/A5QBC575ldURrXdp5heKCFORts1P2
	 9YANSPWmcsQKpPUIgq3eOPaww36naCjVHOEWc0cASFIjrvPORNyp6oM47YldLZKr+eGeC
	 Bin5VcYqXAn/zD4+u/AAomzq4ccCz2Bwaje7k2iPVEf8slBx1439yq6t4UPvNnFdhbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB174606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB174606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b271e573adso1161060b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=ZNpsvJMizOoFFuviUq3R3I7xBszXKHR6f+dU2Lhp8+AdJOsuucW/Jpjz4DKxOc01P8
         7Bf2gXYBYorSyL2ypHSps7l13uEx7uOW/BQ3oCjgyM7fn4nszFId/ZhifmOhhkUhMak/
         Krv6vg2ZKrT882kZ97nfZeCj+rR5WiJ1p/wW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=H8kK33w0cDGEUWqQq2wru7PjvTTdCpJmmCt5A11hzdjfs6U77IGpI+Ojkzn3AMVmBf
         27bAs3zhp0P/W3smW0eGjJqFEw/aIzrapOSrmeUGOSYm4asWgdqtHqK9yMug5OGAEGL5
         sOz7J7obVkofyCp6Ka8rGt9I40v4D7MdAeRa5raXiawj+OvesdAdp7K/tjt78fnWdcSX
         n/XrnnC7mKWRTyOKmo628KrEv5IuPvQXgGIs8xzOY1+pcp7ueSBVazT7dwCBR54kIk0l
         Bj54MmtBCII642i+5dEF7GIR4yKdgYaoVEa2AJTzxB3Q/VHERJJBshMfdDm9eb3J1ZXK
         xmtQ==
X-Forwarded-Encrypted: i=1; AL+hErEWz5HkYgCW6F14XQuFkkVCRrR60SLniG91Dfs1SizRrrZlN7X0++XKaM1Lzd1f+Ev6u27M/cVqqTn+14k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8piWRjXRG8daEkMnYfga+he9C+GfFRft9hDbVfq8d+dDIDullz
	2m2tnZgxp47HtTuyICiJSbztGtr13YXCzeyZzt0kfHdGsK5zOnYhfmFcLewcLiYSAgk=
X-Gm-Gg: AYBFou1npsBW17GwbEUb9/yB/U+BKkAThSRYjoCjDp2pGqYTaszOcxi6PM5+JUdtwh4
	nbQZH8krMTnbaOxMbBQWkAf8PqX3cVIx1UbuAy+nKcdvA/UxZfQRAO7q+O5ESh4PJl56KWkjmSF
	eyYpCton4hk38pp7IXxZxKmNKj0yXLaAZyLeKXKMXCXeKSU9vuk2JJJ2/brhmDyfM1yRJeiHMqa
	JDD5yVQWvyzyeBVai5PC25GVOD2gK9e9KoqV7vDO/P9AkGsy+zJW7YzBp+qTUBdFpp+gLTJ9U2C
	i7qcwyPG4yia5jozD9Z0p5bTYSh5lJ1XmVE8BvZSk2d91jNxgV+RgM8D4iLAyQRnB5ZrsLRZeXo
	QWF4p5b9y/iBiip9nvLt6VakBrk3Wqmg/HllRwKbgrKb4IOkI2hpgP9S7WnGG7bCGbtjEBi45fx
	R6LR9W8REtJXoy1GB4nepByAFZ5TrGYzk+H4Y5+g/mjeIpz2nKc1eckxRBt2oS1qlCU6E2pG9/S
	n7tTuBSTJxvcNv2nbE84BBMNIhLgJBizcl8xXp513P/QMRDJO2/AtQMcQ3h11d2u703FeYPYhfQ
	gssucwbN7c46H1Hx1gu3h1VwYYoOzy1b4hrA3/24ebsR9+1s1CiftiZuzw05RExJI4oAOJ6+esj
	KHiFnqGsQlLoWT9iacAhVXPAfqtabxlJTT7Ncnzerm6tm/4UsjC65oklonaQWVeS2Z5jPlChKzX
	+6MQR8P7X4XN786nN4ha6+AZgL8PYkQ/g/ylHfXA894D+N04uk7NvRSByW
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
