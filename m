Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590316;
	b=iiuqa1uQ3behB3d2SGae7junqIfRFSflGsRR5asJ23qeFH+W5Bp6dHMt/ryi0iWWFln/
	 1KDHZqwHtDX0Ykd/3wzZyW641LzlDFHWoewbsXryRjrE6xQiWI92xyLEIoz/hUuf+FYPG
	 EZApLjmn5ipG1SZ1UTBPwHgKVOMs64giLIa4tfZioBWxpQTII/uRCVlXmSkKSR3tuCeJZ
	 BPLYXyMi4/4/e68u5N/wzvVc1l6kEiTGd771bG2cZ9f195O17JkUNvACcjldbx9+7GPAW
	 ZhmgwrU65waPk7jVpOYaHXBZjtm9Sew3TkfYagl100do3HgpPcZjM2azL9gaXW4EIVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=3C8tSwHqjzI+bnh3DElyKp/N4OUqkqrYjzdrA+UxunU=;
	b=tcZMJsMdBiK64RMj6pJxjZCy2QYb0HJyNSHmrOd6nhowYF3VleDDGH8Ky9RZPaV5uYCt
	 /OQLnX46QkKRwKgekgwpNlZ2gB6zm6KJ6CgEEbD2ndNMVoWQ4FBZr7jeHrUydlR7m+zBO
	 +Fp4vWuBGadoAL+ARbGo4NJ0H7kKpDw6ZYSisjJY87p7iCOaLpz0PZGSsAJKPaZ9axAye
	 +/FruXJVq/EnDF08EKas+9ylBa4PAcuHEE8XALZySff9i0Z/syddV7UsMCtx/AuOtN/Vg
	 mSHxQbdqdo0rG/uq8kgqHZGqMdXuHyKzAXrhZTsjM9UMr9Rp3td6ldktBGXRLc/GB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Js5JUeMr;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09060A6F62
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F09060A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Js5JUeMr
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed3d8877e6so16350155ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794590316; x=1795195116; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3C8tSwHqjzI+bnh3DElyKp/N4OUqkqrYjzdrA+UxunU=;
        b=Js5JUeMr/jjG8IP4L7djYwEXs7HWQC/vfmV4sl1JPlvn9LC9U2xww308mqJNDLaSHu
         p9pOkNTcXGvg3W5OPDDMmxc6H37fUHw2PpHb9j37/qvZuY2OH80rQS/SGOZY9ja0sxay
         v8rKpl0Le67un0PBdA3AUEMpFtuEhUUfTvt2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590316; x=1795195116;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C8tSwHqjzI+bnh3DElyKp/N4OUqkqrYjzdrA+UxunU=;
        b=VoITFqYQnEkhCJ07jvV3g6CkHobunrirIAVadkpWzSDH900xJ4x4WCLXHVOheqaSmr
         MlqNUa/4Ge+K/SvjTwW77NiqJfpokkoiY8Tj/ICJUdW/05xhRO1G73r7ua7BMH3tFkbJ
         HmcPVXn9+6xOxb9fmLptqM0Hs3c0qGba7Num0cab4cP/Jon8bX+P6q29RwItEhsqEobS
         R1/zFjLVTHblN/7cV8qrfm3RKc/dIZK+t+ROiNJF56J44HxFy21gCBhLylMFgSUrZK4+
         H6FNiX+M4K5ueP4KszYKpGcmB6a9uHsUTc5ytL0XAQGmsmXBQdkAm+fRXlcgPnF6msnQ
         mQZg==
X-Forwarded-Encrypted: i=1; AL+hErGZqSh7oBMK4+vcuVSemvbykFNnM4b4WMgP57M0xfTL1Tq9HLDZiCn+cKl6vOmVbFjWfw7TRX+XbICskRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YxfgwXoReHiDUjHFZu48G1dhr4FJn1d3N3Mee7fAR7kZA/mTV
	ezZMK/aaxqD4vJl5R9H83I996pZFEHWyalaj1zZHc5sKPPwGwO+pQC/0pSsyyBZyILw=
X-Gm-Gg: AYBFou1mdKRrG2z3SfxSIeA8pQBsQspO5TtlwDL3Q/YU6p4A4wHXjVQGUduTcQ1pS6B
	2z+NRGSXmI8eum4VYE13aemEnCmv9ValJzbNt3/xl+9STbnlK2GvAYv2osBgwzX2FsVTy24uiGx
	f3iXt/UBv3fB8uQvpuWfno2Jc0naGtbaNzp7Q1FRCeHRk7IQCoNcmuximtZyK5h/WYzE1ZDb6s5
	G/8A6+1u3VKex/XO6wEFrwJEbTNe8b9BgVxvSWiSzecILP1ohMZfiYXzF/+pg1yukmeVldr36QA
	ZCagJ/jKoMW+fasfnQ+2gU7ASAJLKYfbxIcOZnDsKu9VTIdXIVMDdxhHiNHg7GBMZnt2E4DhOX0
	Uswhdztrt1f1Qv7n6VM8gYPEcqlLTKHaVv2Oum/3NBcv3/rWhVbybe7Zn16SGHZUquWfaBjheSe
	eRxxsGiUZKehamq6e7QI/80t3EDNm18a9mbq4QXb3oKLWXP1fRVTUjwf6nXeqJ52YbB9ZVfr5WL
	5PV5B/djee2ANsn/WwB+5Id5b5PLVrWxgkapFbBqKbqrgsh+rM+vJ4DcYa8JQaozOJGRI1Wv71V
	oslt5riNGJMgfHDTzAsrR3UMfocJuOJu271WeM3ZA08MN2X8siDpv6TrkfCcO4E7HGhmpIYBTLx
	k3O2BJlgaA8f96bHSom7TkyWyVE+FBFcRaUbmUBSOoJCDuJw8CilzEdzXzwIGUFh/PhngmifpZu
	A/+AwWf+SwZL0t/FLVyKT/rV3TkMLPnGoCiYo0iJhsNXB8lFLqqWwYj9wirGI=
X-Received: by 2002:a17:902:e74c:b0:2e2:d77b:e586 with SMTP id d9443c01a7336-2ee0df12481mr33259215ad.60.1794590315817;
        Fri, 13 Nov 2026 09:18:35 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee10bdd1a4sm12923515ad.11.2026.11.13.09.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:18:35 -0800 (PST)
Date: Fri, 13 Nov 2026 09:18:33 -0800
From: Chris Down <chris@chrisdown.name>
To: Usama Arif <usama.arif@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, terrelln@fb.com, dsterba@suse.com, hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, chengming.zhou@linux.dev, Andrew Morton <akpm@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 2/2] crypto: deflate - use vmalloc() for stream workspaces
In-Reply-To: <20261111153532.1036709-3-usama.arif@linux.dev>
References: <20261111153532.1036709-1-usama.arif@linux.dev> <20261111153532.1036709-3-usama.arif@linux.dev>
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
Message-ID: <20261113091833.6dccf0e5ea9aef18@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Usama,

Thanks! I've tested this with zswap using deflate, and it works well.

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Chris
