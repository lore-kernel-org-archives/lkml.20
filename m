Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B55374A04
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018044; cv=none; b=IKb4tVJ+DDxeSy3003ayGjhfGlJbzaH61ApRvI6+sstmeR5jfdVR6i63bzLANDE0973PWyXnsnhqhpr0b/ymGw28POOZTlZEvuBKmfyUcIePSpY24KX15MJVGQ/bec2jQ5k4KbcYeCRb40ee5pl1nTfQSXqQpB5ccFUbNFVqIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018044; c=relaxed/simple;
	bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiuIN5z/Xw0OnX1TZID/Ht4ymgJXiObYufYs/fagSQX5v54gnq4nc53O0O7kUNJe22baCxjzus24+HheJ31k6pcCOQEyOISH09SYPDcBiADDo7/BNo6HvWEAyg0tGQM4PAPCwvfk3MJd0fYTNJ5wHdLRoAKVcheEP7xWHi14r6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL50TiFA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL50TiFA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df3912dd2so35457f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792018042; x=1792622842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
        b=VL50TiFAzlXAPDV2J4V5NHbGoErhby4V54tAUvLB2cbP+H9N0M4Mgi8GmvObAYsokq
         RRqHYLAJ5ZDJzkTZ38HqvGVXHGosYw431sRV9OhfUi1p6FE3lK+GPfq9r7NkytmAI+66
         2WG7cnSdDL5LXG25zTt2Eu3Q+22vYR4t2BX6/7cOgAwV5mFTq4OghzuFxPu5rKnAV51r
         zBym6TAecWDbsZW7K64ketfZGSjxYhKUd42P6PixiEZA5QJLKQ+zbm5LGroDW6py7Rjb
         eXab/ZwsvxdRoJA4fpReLDIiCgBW8QQk70sBwTEsr3OtY6c5k+/OxpezON4Jrh0jKPYE
         deUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018042; x=1792622842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHMcvKy3pKTwKa8Hattf13WL89UUyhvm53gr9aJVY1k=;
        b=AJDP6qnO3G/ylUhtSUL21HdP66RpEo+sxfvFC0fOeMvYQeUMvtHLLufutmjAcCKC9K
         O671cSEAIdK/llqPUfvalDA/IpVXQ+V246uFQdd7651kjkVHAEh3/P54iJUR7Ladv6cG
         YFqoXKN8kP1Q5kw+CJz7qnwi6dB1Tgpf2mCNst/lbHtQfQbYIOsbKM+d0VO8QNVWqedu
         m0GE+HB2vKftilsebepIrlvde5KXWISyxst/pqOa//+sd99URAGbU+35fFMAyaD+lOc6
         mM2kLpnngnzaIvu7HzBjhRtUnlP7i6NwDnjbyVdneQYQAOjLCvcyp9sFxkJm9vaoBFxc
         1wrw==
X-Forwarded-Encrypted: i=1; AKwUvBx/698hs4jmtJlOLy3dDowfm4jnuSBn1UCLGnrGIYp8UqXNGadUP8CVUxgycoFBoiQvmM3nc9UF0DDLrhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG/U3q3S0igoFdzTkobvyiUozo6ttWYs9CviPlH5J1aSG1jxO9
	TrTW3laAu/cdL1D83RFhK5SnVY7fD4ObLv2IZYXQLNUi1rDtBj4MUwfY
X-Gm-Gg: AYBFou21RiW8Dzyc/DTFJsSesMZ4FBWxA2sCTFpLvBI3LEbuTvcjoxyKmS/a3W8yVxg
	jcxe9E9cN0u8gTpF+xAifZjugOKE1LrW+Lor8Zk9pwRQ9sJe/VejvvAoeOz2rK7/bvy1/hJsNid
	Sa9wS5HPW2IXYVdAopBYIayNcEDFS27NZohsTJfhZTPMBSKZ4e8mlW7Nxcdn3go7FM59OMwHVI8
	hRteQIuEZA4y3R201pFbjJWbTTxJskFBBAsE7g/0EPM10EVZ4iDCo88bnK5KhnSvLzFyUvx/oD0
	C3wH2PEoyFCtkRWhbKpm1Lsj5K3j5gF7FeCkN5mvC2spfyW6+AwYfW1lXRWtqeheVHtSi06Snqw
	nzvo7e18KudZ+VPceMPr0iCOtM0H0zzwel8davRzrqvsPQWd2Z1voyCTU4+iiYL7GcyjEo5ODRL
	nkvpJvCEo3QmImUnBvVAUGwSPtQzCMYP9rShbUGFrkRAtUUfhwnHW4c6DPRj/mTOuLL8Esl2R/0
	RrDTt94AvVtZvvwS5I0
X-Received: by 2002:a05:6000:4696:b0:48d:f1b3:7e82 with SMTP id ffacd0b85a97d-48df1b3802emr1743774f8f.0.1792018041592;
        Wed, 14 Oct 2026 15:47:21 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.9.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm10487119f8f.29.2026.10.14.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:47:21 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	bvanassche@acm.org,
	tudor.ambarus@linaro.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Wed, 14 Oct 2026 23:47:13 +0100
Message-ID: <20261014224714.16922-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87qzhsurid.fsf@trenco.lwn.net>
References: <87qzhsurid.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 11:22:02 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
> Neither of these patches applies to docs-next...what did you base them
> on?

Hi Jon,

I had based both patches on mainline rather than docs-next. I have
rebased both patches on top of docs-next and sent a v2 for both:

- https://lore.kernel.org/all/20261014223134.14772-1-emmaonana18@gmail.com/
- https://lore.kernel.org/all/20261014223437.16164-1-emmaonana18@gmail.com/

Apologies for the inconvenience.

Thanks,
Omokefe
