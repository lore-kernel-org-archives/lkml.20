Received: from mail-dy2-f1.google.com (mail-dy2-f1.google.com [74.125.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512E443C0A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156501; cv=none; b=k5fPy+izYYvGhVSsp5YGXQHeGat3WwRVdJ71b/9d2bLeotreAG+YxvYuutG28y/8CmSIpw7IE4kac1sgze2/MIAzTg+dKf1x/kWKodl/cw1uZ1hUihqnY5/LzrvRaKTeo/2H45SYSZjDAVAyA/we6rD2XuZwluwJUOd7xYxrySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156501; c=relaxed/simple;
	bh=8KRd2IeBcyI79hkB04B1fpSGvFrzC7yk22zox4oFbxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erSOTBdbPrsV7wxJMkh2PrNuMS+lkxXsw6ijMZhZULnijV+dh7BGHvMo9nOatL4jNGCzGZsbJV4U4wyqnbJBcEi+3fiz7ToSRQFjfX9sY3x4aR5KAMDfswYpEU6bbLGj3xleNMWmUY1PgqhdgGy1DNrxgGO5gzgiWH8vIxs0uXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUq7WRWt; arc=none smtp.client-ip=74.125.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUq7WRWt"
Received: by mail-dy2-f1.google.com with SMTP id 5a478bee46e88-313be8d47d4so368848eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156499; x=1790761299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEoKsgWSINlMeUP0j6kujHfz74zeFa1j5vE3VMbHVkw=;
        b=fUq7WRWtBf55mOPPROeg+JVIGrPm05Fk5FKWfubHtY6eQpEvDmZ0/Jhm6plF4Lywa2
         DzODqSmYNIQwhYCj0ZST6SFauakYP+atbVN4DVl4ME8loPm3akydmer/1nUd20uDcAhl
         c61E0asuw8uFtuKjpOVLFzu9If4Q9PshOiSWJ7vyx8eWzusYk1ul6Esy7x/yMsmojZW0
         sgX6ZwDcNMLONRPZie4WWpRMyTP/e5rluSRjewmIdCJYMH2SrrK8ZDtdOTXXaG2ZwdgW
         x/QY5bxFPA/p4Ht3ZYx9SI2g+Wc3pSxj3rgcCScbNU4UgDAUWaHXZssMQJrLHtR+3GRd
         guWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156499; x=1790761299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEoKsgWSINlMeUP0j6kujHfz74zeFa1j5vE3VMbHVkw=;
        b=qOEnUhEYmgCjnQ5CVoYuDUPegQArf9gAniONC5TprJVm3RHQFl6Q97anpcxlo3rz/F
         ow6NAkZj7vJNwlK0VY9FzG9s0G056X45mIQ6+iS/IovaITuqxk1mEQTUA2kwE4XVhDW+
         uvek7rf4mCtiipIj3Ezm6gBygkxjL3ErBmRDyCxTpJsTbWj1T3CW6VNTI8hajXyhrWTy
         GKkoAqXvujJUHVD2oVxXdtjym76gVLKz56RkSphVuNbKPi9AXXt8oEiO7M7/5w+vuzAd
         804/IlqY3kAXr3/O9aHuMfPelnTX0n2sZ3YDDf/M2ExGXnxz+k7nxSG7tETsNeX7sNgV
         6pLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx02vrkqwDmIleF+df5Y8PGEJEtbSWie4Ehp6OkEHtpzNmyZ/iG7BFAWGNuecJ+TBzwHgzHDzRFKfvnNqI=@vger.kernel.org
X-Gm-Message-State: AFuF++m0E4vktNAIui04dD8WXc49yj4Y4GTLVCoCxX9O/aGPrkZLgt6i
	o87b7bsBZgnOErAkB20PDJSp40XJqHfO0aIFCFY4rFQG9dSPwcH4aCBTXtCv9+4=
X-Gm-Gg: AYBFou1LLAGaajNsbeZUgoLsY6SkCzm5JjOSGpVZVOz0TW99U1nNvLUt13OT2evpnW+
	DygazBtNAf85pEELalBTuhyT1/FhVjDvRJbMKO0vjHv3n6Rpkz3utrqMoT9Ql3HZjceYbxpPzb7
	96mxmaYh4uBGZtyQilly3xkjC5gR6hRmqueEaX2BM/azUoNABEZdoBkeB6Io++eQ65dTDEYD0vh
	fFZlBf/cJwjYeCffhFdueXJB6oqTtYWnl2EsWSyT1RecB5E0sAEbyvnJoy1+zxaGNB70VTro4Sb
	EOdom5d8Zvv6D/EqLVT/5CYeT61bsPR7Ny60O199IcwecouwKFLR0crETGg/3td1xfzfBOh0LPB
	6kM6ZxDtZiTv9be7I9TvN0+3h8PpiaPaq/0u/0XagBOwltBirx5uvthjPkJbGq5XeUgFnuHjPxX
	49qJCs516avr8O7vFyE/Q20bErL3X3S2ib9Y/KY+7ZNGGpqgcygZxlFHgf2s0Awm5JDG4Fu1qt4
	N+ILJuNdrilSPVjGLNLI5WX
X-Received: by 2002:a05:7300:fc01:b0:33b:f062:a654 with SMTP id 5a478bee46e88-33e9548f062mr1886015eec.16.1790156498684;
        Wed, 23 Sep 2026 02:41:38 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b22:16b4::243:71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm4894525eec.8.2026.09.23.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:41:38 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: gregkh@linuxfoundation.org
Cc: srini@kernel.org,
	ekansh.gupta@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: Re: misc: fastrpc: is a ctx_idr IDR -> XArray conversion wanted?
Date: Wed, 23 Sep 2026 15:10:01 +0530
Message-ID: <20260923094040.18397-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092338-banking-tactics-2cfb@gregkh>
References: <20260923082254.15312-1-muralikrishna2444b@gmail.com> <2026092338-banking-tactics-2cfb@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 11:28:52AM +0200, Greg KH wrote:
> I doubt it's really needed unless you can prove some sort of advantage
> for the change?  Is it faster on a measurable path, or less memory or
> something else that would justify the churn?
>
> idr is still a fine structure/api for many things, they don't all have
> to go away, otherwise we would have done so long ago.

Understood, and I cannot show such an advantage. struct idr is already
built on the same underlying tree as the xarray, so there is nothing
measurable to gain here in speed or memory -- it would be churn for its
own sake. I will drop the conversion.

Thank you for answering so quickly, and for explaining the reasoning
rather than just saying no. That was useful to me.

If there is something in fastrpc, or elsewhere in drivers/misc, that you
would actually like to see worked on, I would be glad to take on
something small and learn from the review.

Thanks,
Murali Krishna
