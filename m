Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2354706C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671071; cv=pass; b=JoSTSTeQQTn4/AOx3gSmhwEbuwqeh76orz8dJJOSMOaC5CzOxdMW1Shhh6ymGwICgbjBjjUIoxHzXZSBQc4YHWj6PhK2SeawdClR8j7AoUIoTSkzpQEJUbIio1zSqd6LkpxHiQYL5EKJHAVkGH/eHtvVV2LIcveinRt6DkZa0OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671071; c=relaxed/simple;
	bh=R58MLDHtjISdkSkWuZvl1J/uOi2P/dUSCBQUN3KxrUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UB91A9oesFF4VnqWWz1RXN4yUgIVX7tAgv8aF2G6VbzfpnF44/GtbF1i1RWMWuWbYx9n0pi7KxA2w+sTx9k5/gth4xwb2LLOtXeQh/1k7C4kxUvX8NAdj3DY/Gb1tE0Sd6L8dasKZLhBN7odokiAlAXjqjWsCt5TMWLJrRmhqP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klbBFolU; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klbBFolU"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f7db0so189857066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789671067; cv=none;
        d=google.com; s=arc-20260327;
        b=gG/IdcSOLbG9pCZs7gaoKrXnphqUSvG0zQP3JEzDJ9VVSHqTT0/XC7ZR5982geKRg6
         3exh+D2xMfn9ZMkSv46nEPAw7vIQA8NCEULv/8cvTgji8au35OZTQ52eeC+Ly+g9X3KT
         fMq4hCLSyKb+Kt9Q3Oouzp+NxTwpgJB1ws99RfE+uKWwKi+uUW2GZw6ZMZOhcnboRuw8
         NPgx6k3RZ/ol/wOoDmT607LEbdYB0F/p96MpP/MZIzwiEEgQzDSEMqeEOVTen3fLOk5M
         LgEovKyMYDi0P1rN0bnKojQeDauQ5QuqeaI0YgAw3s6K+++Udgty6XLBb9tA8n9vvvcz
         oKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
        fh=iGk3+Hnxwtc3ekQ5CjaG7e8iIuJo/cpYb8t1p8QQLeQ=;
        b=CpaUjqJzgCkTdRVJjmOm7frrhO+F/T4VN8T+20ojvi40ZKNvFJSZ2jMq8TxvLumqLS
         DB7wYi2CJLvhqpbhpR3p7rCfgzuJ6X19ZGjRvw+UV7/WTFrQnFfw4uHiIKKX3dS/gGUm
         occRyduGTwFp6oKd96yIBGBHM+K66lFNEn9p7qUP4Da3hzid3NvtMDKKS1XWVY590pA0
         PBMYnrmjEndNjAXzQX2zJK6x6CALG23DEeWLUPYmEbtj84iWDsHH/xxFccgK6eqGTkqs
         tcFj7Ehu11JvS0JGDEQqKyVp+ok89i9sGwFp375vgnxGEwoLT2Q+Z84ASRdAX2xN55Um
         ktgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789671067; x=1790275867; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
        b=klbBFolUxkGbWx+rTPQMxG+hwJTNamdTz/xXaaZROQGAk4xBNQ3KRbpVqHh+bRh84w
         EOL3nEPHtUlvVtvNuArEykjkh45/vW59S5nhRGHhrtk2nAH1YI+Rf3yiYZsc1MP/M9Pz
         uSDtw77oaayrdXlE/BN95A45KjSP1S2o9Bbsyu8PhjgNnCOv5ltxz48kxWB5MwYUUWCN
         Ymsb5HYNO9uzgoM3igf8IMaW0Nlpcfv8TFOvhkrC4zOrOJWAHn4kJ5D1/ytK2YHXkdDG
         T+iFbQTqcw+P9bkfvs0+9+1RQCA+wwuaQfzyo+NfVbiIc/qPR8QwJk0xS2taEeULh6xG
         1yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789671067; x=1790275867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9kVz82MAvAbBww+/Fr0+me1zCzCm1neo4UwNfXq+b7A=;
        b=DJS4hd0rQD5AQPPlA1ddpyloHgQ7D+0dW2kJS9u40qxhfLfIxCMthXy9zFUVTBDHS9
         0esdIEr2XRseEkzbsKrUVQz7OowPflYINIG3wE5T5hboX6MK3a5CVFLTs8ErGAEbYkcG
         KpeJMj9INffJ09NRGPFsVoK9e30fMfIaHRw6WzbfmvJ3Q0il+hRQwV4h4BtlLVS8gqBY
         XRKrb3EbX3f8fJtF5mwInzNmQA9xprW4WHcW7q4uuAqX9DiU2Ge5Fc0xRtySoTfMyiMP
         3WeVP4YrSJPnhSw6tqFi69+1GtBlzoXuC3xX40tmUUQDpYnmREL7WVh2ZViRo8F+UviO
         1bmA==
X-Forwarded-Encrypted: i=1; AKwUvBzTC394aGY9Dy3VFd2pGXI1NKxey/SmrlqWFR5FeWqIZIFnbn8NQDrZzANsMOYetX903ecANpap56fIzfo=@vger.kernel.org
X-Gm-Message-State: AFuF++lWNfxR8WQF7+Zs1PyFmw+zeFmRSx66YPMXeJhY2di3KH00Lbft
	PiynHuMizDuGEtQPK7z92yOE/yR52RinF4ZniE1rWyQmvGrnpzNocw8w+uDjJBCn36/RdaB6t6n
	FPqUmsjwxMZnMyVBMbYF+8bknIs2ZxTY=
X-Gm-Gg: AYBFou1XEBj0dL108A+S6UNEyz1tYP/QjuGjBAZuSjOZUir04q1BVmSnsbtepD0bBL3
	laXXdiN9PBn1yzEGEV+6++whsFW4fC5RGWn6U3Wt++O5sIP5gXAHWjA3njBOOKU/fQ9tjiHs8OV
	9u53l6Kl0aCoIGTHWrb1/G9b9MCNk1shroCO/PTCN9aITR6RpXDq2xDSwDMsTDtBvLborwg7z3e
	YizvEuDapbAuINf86Nu71bI9n9DEmewIf79aGqIQh1qjEhGL4op3uX7EXT77OJtnDUWP+IpvXu7
	SqSpgxbiI+ratwKE4yqCLUBkK43tYnGC2WSjYyR43KsLCAvmvhVOvQ==
X-Received: by 2002:a17:907:6d06:b0:c29:3a1b:ec8e with SMTP id
 a640c23a62f3a-c2a1569b034mr13494966b.3.1789671067393; Thu, 17 Sep 2026
 11:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912091805.531666-1-andersen.theo@gmail.com> <c7215b173c533cd697d8eb37b56c2a1890ea7c41@intel.com>
In-Reply-To: <c7215b173c533cd697d8eb37b56c2a1890ea7c41@intel.com>
From: Theo Andersen Carton <andersen.theo@gmail.com>
Date: Thu, 17 Sep 2026 20:50:56 +0200
X-Gm-Features: AcwNN1WHuc8o-nFGlfzO4INLAjuamK1x7axEj4QEzHLMTpq90hpTZl6XJiyGKjA
Message-ID: <CANFnrsrR-benwg2i=mGs1RywuwcxkFE9Pzw8O7kGRQnNyit-tw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11,5
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, 
	tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'm guessing this is v2 of [1], but I shouldn't have to guess.

You're right, it is effectively v2 of [1] -- same patch, no functional
change. Sorry for not labelling it.

[1] was pasted into a mail client by hand, which hard-wrapped the
"diff --git" lines and turned the leading tabs into spaces. It did reach
the lists, but not as an applicable patch, so I resent it with
git send-email and didn't think of it as a revision. I'll use proper vN
and changelogs from here on.

> Is there a bug report about this? Would be nice to see the logs in the
> failing case. See [2].

There wasn't one -- I went straight to the list. Filed now:

  https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17087

It has the full failing-case log with drm debug enabled, on an unpatched
i915 with the panel muxed to the iGPU. AUX and EDID are fine, and then the
panel's only mode is pruned:

  [drm:intel_dp_print_rates] sink rates: 162000, 270000
  [drm:update_display_info] [CONNECTOR:93:eDP-1] Assigning EDID-1.4
digital sink color depth as 8 bpc.
  [drm:drm_mode_prune_invalid] Rejected mode: "2880x1800": 60 337750
2880 2928 2960 3040 1800 1803 1809 1852 0x48 0x9 (CLOCK_HIGH)

because intel_ddi_max_lanes() reports a source maximum of 2 for port A.
The matching log with the quirk applied is attached too, where the same
link trains at lane count 4.

> i915_vbt from debugfs would also be interesting.

Attached to the bug as i915_vbt.bin, 6144 bytes -- a $VBT HASWELL block,
BIOS build 1215 dated 12/13/2012, on Apple firmware 427.140.8.0.0. Say the
word if you'd rather have a specific block dumped inline.

> The patch itself looks sane.

Thanks. One thing I got wrong in the commit message, which v3 fixes: I
wrote Broadwell, but the machine is Haswell Crystal Well -- i7-4980HQ,
8086:0d26, $VBT HASWELL, and i915 logs "Found haswell". Apple's ACPI DMAR
OEM string says BDW, which is what misled me. No code change; the quirk
matches on DMI model either way.

I'll send it as v3 rather than v2, to match the numbering you used
above -- neither earlier posting was labelled, and renumbering them now
would just recreate the ambiguity. It has that fix, a Closes: tag for the
bug, and a changelog spelling out what v1 and v2 were.

BR,
Theo
