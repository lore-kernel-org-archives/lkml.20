Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451050;
	b=pOuQiJGmlmED9SY6/89VRlH6OjHjCppFrMwlT+qMZDLxvtlulm7o2At3Q/G3wZcqElvG
	 VhkcGNoDocrq/PeUTSs2cKJQsBg4ULFSgr5jCQhEEdOZKVKUu5aoSrMbgEULmC9IIvthv
	 E6+22JQlWxkNRFBSXu2HwLl8Cy/hULnjlINJ4+lxmCvlRZ4wYgrIrBl7OWrWI7vGBxWlS
	 RShNOqltcFaSJgXDMYxRKfuESZKdohykjFVyen4nNEZlYfc7z9hJAwLvmgFpKbHFw7UX4
	 YtqO7ZpHScSf3rZc4ByDv1i1DD6685bNEuXk6uY1cJ/5toqUdZ3JTJ0ytZZiaclvBYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
	b=UdBT0ff3+s+IELT64dfKzUkIM6YrcLcpNsfxvisI1rUAKnDLOhBNkhIbX0rOF72SJcGW
	 rNntH+09RmnaZ4wcRBFp5l2oqB3W/fIspxFmJgEv5HLDCz0kNxVhJcip3r7yFQFqswbzm
	 aGAUjUqPtuuQpW9lBxkKo1kdQkbXPaTAt09aSwp0QP6jDB4TeVJhP9aU/0fRLOpvIzeaC
	 bOXjRykCfgDuDAh3ftxoI3LKtBLF8WrCKyZdvUlGbIpLIDVOXQT3hm2eQHVtQyJLdfPdg
	 fjmpC8UQl0bpcA4t+RBf9TwHHNTFLW4PWk4z7QJ/wOJLCGHdSAe+qQTCtkA0jWLbUMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV4Ocd83;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C35D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C35D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YV4Ocd83
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-85f34b20042so2175050a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451049; x=1795055849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
        b=YV4Ocd83ZEL6dSY1lGsRgph/VYFnqOTTFu2Q0BYLMoRdywdLSI/Yg+H+J4bpxQS0a+
         erlu/L0yvGS1teBCU5edcLKPoej2u+ygT5sWEYhf6CnKJ/ttWbyNBcACUVt5ByO8Q2FL
         0RWB9k7qEkfjatxHmTBJU2ePy7sYq+BlYVxvZCBj2tTYRfm6FQFm5dHnMYoVO07231cG
         KMp+X9fgVk+lzlf0viaoG3TZGHVRsRnGT+WIPPgZ9uHFkWkeOslLTyP4OUUJkFgDRjAO
         aPZ/nX5+CtTSD1QIcCSgznP9Rprpb1i6RP48Ipb6g6I5vhFGru8J9A/O3Vov1Xh3fDob
         lJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451049; x=1795055849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qesAj1YookgsGmrIJwAsR78h/897pOPyfNqHIr92fhY=;
        b=zZ/YhjnMRMIL9E0Lm5MBvhzpYpdeUDqwjEFcEq9VBBWHn/cyrSJ/VjZ9/UeAUIi72i
         nIAbRhZKRSH4cij6HyHI8yJ2DFwWSQvvfdzEoiW5sm8/nrw8lIdB4sLy8iAmoS/fx42R
         wLi9eUdfvAudsAn7rKp9PVfxnmx8qiQV7nG49B3bvaPCewZ1xRdKQkHIOEnvD+8545zL
         j5rNsVLaqQ+7oQjbbkw6NPuzPFPW1Nd03Bql8IrXrqrMsPXwIvB9Zm4tdZzRGOHsPG1w
         eEXmZkIi7XZQeVGLv2rmxBr/LQFqJmkbuaKGXaSajfY75chedHwqRIzSRvU2qga4VX6x
         II4g==
X-Forwarded-Encrypted: i=1; AL+hErH0tq8txY23NDTRf2yeO5aHaroV0JPM12KfxQqRRLWETht5bPwAAbiPhOt/zH6eiGIuOUodVUtxtcPP44g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P0uprqo5hxpzACsO27tZYyccY7HKYF8KpIAEGZfQTqg+TMaub
	1EvX7wDSoLm0wL+7MLRFCaJPyFJitfvKCqI4tdoKBl1Jt/RQJbKRB0SR
X-Gm-Gg: AYBFou3eLDOzGYKsuWwSNs1QZx9WqOyFbYCLi9xGWiikwC5UBtO6M3dBjJcdQUXhagQ
	GS5XNl26tihrazWvHGvruUJiY2+YqKZrVnaRa07ejfc432meZNoPF/ThwRzDFOD+wB0lVtBTAdt
	j+g1IG1gMN/w2GuDAM/RB6aSoUGWbE9PVW9P6safEDm1sEZoa5uc7djXJ1i5WnnjqLav4EUj8lm
	5rL7vrw3rScWMPCJdouMBHrwytiKUqMoNkbnz+e2dK41wIadpqA+ErKWkRAOfaQbPPBpRoV2JE6
	vu0YTpD2iXCoQ0JcvrOUO9SFmTiQehWqo1bCR8NmVl+Ibps9ydgvQrr+OqqzlwVAl9bHEMlQ/Od
	z1dIg3iVFOUbp/j500LZ9P2HxgjzFVhfL6b5xccXjCFult4E8svCSAKhPmvelmk0hwIB1aV7CVR
	U6g+2mJvoUKdtW+1rwC+dgC6og3EEEJjsMOxMveXJznJwKIvwOcubGJZXQry5dp25aWE4xHiXMA
	oRiYLixKc/WyFWlc/whBEFIyUsOg1Wgu3QKSDNzzuyimqg6YkM2Hn8EGj3cXlpZU4Lg6xwTNg/h
	3ayXKH1ek4WLOFtNeq9OajItazMbQQl7JlgCH2cVRVSEYw==
X-Received: by 2002:a05:6870:c254:b0:49d:d617:b692 with SMTP id 586e51a60fabf-4ae46c72dd6mr3963756fac.49.1794451048782;
        Wed, 11 Nov 2026 18:37:28 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:26 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 0/6] ALSA: mixer_audient: Cache rework and simplifications
Date: Wed, 11 Nov 2026 20:37:14 -0600
Message-ID: <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avOFQAGTVkCXgs2l@khmer.arcnet>
References: <avOFQAGTVkCXgs2l@khmer.arcnet>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

On Tue, Nov 10, 2026 at 09:57:40PM +0100, Christian Ruppert wrote:
> I realized that usb_mixer_elem_info already contains an integer array for
> caching we could use instead of our manually allocated cache. I suspect we
> should rework patch 10 accordingly.

I like the idea. When I read the code for it, I saw a few more places
where the driver could be simpler. It seemed easier to show them as
patches than to describe them, so here they are for you to try on the
EVO4. Please take what you like and drop the rest.

> I'll prepare a new patch 10 but won't be able to test before the week-end.

Patches 3 to 6 need the cache change as a base, so patch 2 is my
version of it, only so that the rest can be tested. Please replace it
with yours. Two questions came up when I wrote it:

- The notify paths clear info->cached unless get_cur_broken is set. A
  write-only control could not read its value back after that. Patch 2
  sets get_cur_broken for the write-only controls. Is that a correct
  use of the field?
- The interrupt path clears the bit of the channel number in the
  message, and channel 0 clears all bits. Patch 2 uses the channel
  index in the element as the bit. Would the channel number of the
  request fit your EVO4 events better?

> Do you think it makes sense to refactor FU12 caching as well?

Yes, I think so: the driver then has one cache. Patch 6 does it.

The patches:

1. Not for merging. It has the changes from your review as one diff,
   so that patches 2 to 6 apply to the RFC with the enum fix.
2. Use cached and cache_val[] of usb_mixer_elem_info.
3. Replace INIT_HW, FORCE_SET and CACHE with an access mode:
   read-back, cached or write-only. The tables use only these three
   combinations of the flags. Do you plan to use another combination
   on the EVO4, for example INIT_HW on a control that can be read? If
   so, I will drop this patch.
4. Fill the cache on the first get or put, not at probe. The probe
   then sends 12 fewer GET requests on the EVO4 and 56 fewer on the
   iD14. Is there a reason for the EVO4 to read at probe?
5. Use one get and one put for booleans, integers and enums. This
   changes the code path of the EVO4 controls, which I cannot test.
6. Use the same cache for the FU 12 control.

Patches 2 to 6 make mixer_audient.c about 100 lines shorter (227
insertions, 324 deletions). Only patch 4 is meant to change behaviour.

Each patch builds with W=1 without warnings, and checkpatch --strict
shows no errors or warnings. On the iD14 MkI (stable 7.2.15) the read
and write checks of the controls pass with all six patches, change
events included. In 7.2.15 cached is still an int, so that build used
bit masks in place of the bitmap calls.

If some of these look useful, please take them into your new RFC in
any form you like. I can also fold them into the earlier patches, if
that saves you time.

Thanks,
Will

Will Porter (6):
  ALSA: mixer_audient: Fold in the review changes to patches 12-16
  ALSA: mixer_audient: Use the cache of usb_mixer_elem_info
  ALSA: mixer_audient: Replace three flags with an access mode
  ALSA: mixer_audient: Fill the cache on first use
  ALSA: mixer_audient: Use one get and one put for all control types
  ALSA: mixer_audient: Use the same cache for the iD14 MkI FU 12 control

 sound/usb/mixer_audient.c | 589 ++++++++++++++++----------------------
 sound/usb/mixer_quirks.c  |   2 -
 2 files changed, 251 insertions(+), 340 deletions(-)

-- 
2.47.3

