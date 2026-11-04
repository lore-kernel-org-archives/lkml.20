Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818468;
	b=0Y25LtSiWxSi+kBoe30qBoTmEbgF2sPrnJJzrePVR/MB5ombv+Jy/aJhJ9sesSH3PnZE
	 fMqwVCn6Fi1vtcIvo22ZSYu4qNBYNqCJQtLVgrpVUgSOPtg1W+S8MZaI9Z7I9oZ4ch/7A
	 N5/jMX69C8TnHWo97e2BGCQYzBdHCI/XHy4Wo3gML3Awb+8sAL7Zhzpim0Hs6ZdPKnTZp
	 FfBAoRa90NoQP5XhFc06c0s2dayPPZel4nb4y68AUG8eec//Xrm+HnMhSCM3TfYeVGqmY
	 7pF+RvUDBL2gTRmSFfXle0yFAkFqHhhptukcilwW5CfEXh8rTZ33r6J5R+YySGW9NIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
	b=uqHz6KOe0rS9fQj1+x9+JqJiuZf6RMs7YKkp32YnaR0ZLx5V0FTd1IbQFyr9az0uMisM
	 eenaoTEnhzoOB3ZaeLjNtKvxPVNYZerI3GTn+ddbGr+1ofym6u0fn7gmaVJ6p4BIfnypk
	 9xktTY8cnZobDpqFhL8mNz2pVnKT3ScpiVoBtvoBZkIrmIScVEUPOyoMJoCVvaaK0FbdX
	 M5FcNq1z84ILOaeLh6B4Ygt4/WhB+MxhG5hnSUhc5pMiYOPsJZpITsp6G4R9Ue+Q26vs+
	 HPVUjZ3owT/JGocXLRiN2hpvjkwkfixk5A2RlWOhhkot8tD8VRfEGtRX4qdbTC2Hpxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gacQa9/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7A6082BC2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB7A6082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gacQa9/v
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so10055281fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818467; cv=none;
        d=google.com; s=arc-20260327;
        b=LLfewmTuNFtvP1CfYLpBCv8Ynm0mx6IZZIcvJQDtF8d52dF6MBeZPKL1dFmzvnG3Fr
         /cZV2psnE5bDq3UdH4YbxTtfUotz0t6wGoM5dCZVr9+zuPJSI3d9P+8cblMv0B3YFUKl
         YdUzCapTaZMrZn0gh89EEpIXPsysqsvQhGsojOEP1bJM69v/BGVAcl9qdKrU9U2iu3vi
         1PDkrJ1B3Z/61rDaf50qDMf6l9NxVzAi0rzH7MrZEEwm2tb6S0lU5OkaQTbSWdn14OLg
         ebZ7B+j/77KbXQkZeFQDTj6rDRTedV58IV0r9b1dQw9lIWq9rqpuf+aCgbRI3TlhjOEm
         szxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        fh=91LRjmWg5+kVxaD4hofbd/BGhZ69Bhlm/3U2iebsIDA=;
        b=NwEvqQ+mlW0db9oT646kyqDloX4CCrY6TvL/PGEHKO5I9d3TL3Fvfq11/wWguc7FSN
         yuh168XJ+a+D9k84Pgn/jkwzfq5aDgukpQZTf99G6BaYMRZyk0vGGsQZ/uxkTnZmMgxz
         9OrxeACQ+LNibrgUiUQlOBGKwlnLZYQnnGUu2VVL8yniNna/zzMUI6GXsWItjcCNuHJx
         aHmxi5HnovWTGuzXTYKrygTsHdw2Ts9JFHCGNlAreMAmWvS3A7eVXhmA7uDJpd5OeKgS
         XmeXbg7cmGxSlC+hzF0mNb7qk+vGLIRTVbfKGp1yAX1w3QXtlJhrGtB/23FICsQcdZc7
         RtGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        b=gacQa9/v1244DuV3ul3QkghxUOJZc5CCfhqJ0JmuY6OAdKOmEY7KWaW/X1IfSJF7H0
         wowY/q5HyT0D6fMiots80HQrC5oU1FZUTwRiURYehYYtfNuszMNqiD3aTAvmk3xA3Ruu
         nWCqUmqbfu4NVIgCPkoXT0awJEk2AJyCCwep9d+AFalK0q0xz/FcGz557N3qvw2/i6qB
         fIQOWMaYvyxTl3PL2fSERaiW4D+cd2Uzx/Oe/laZh/zHkbWmJ+RN79xGwTbMy2LqO/xm
         HWzQwf555u3GkfTEmBMnOfEQ/3SaW8/z2bYxqgp4pcp5bRvwN+Jv4yjWtFWqcBdsg+/A
         /pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uQ0/+i7Rib4A9xdMc9HRUVG1zZvttqJsRXd/p7RWSU=;
        b=VMRJFtb+hHySXqLlzVmUVPKe0tAPUGONzhkUaEwH94vFLxCI0sCH0OekrvU7dOIG7J
         Sr0JDpg7V5Slw0IJ8M9t879+y1tm8n/VJWwCVg5UuWW+KYYLOOW4CEXrTQON9lNkD8XI
         i2EXfm+n7LGDPRlqiHcsCGWgrdyqJDZE08BJisB0vU0rlQdnDOMF3ofcZo7d6GeMg0Py
         XulhcJK2NjumMr/7iUUPq005R8dWxAfAzNvyG+mfd80wlQ4o0L9z8yLKQnDUkuXTkhIx
         K87YEtTIOHZlmnGbED/8/79tzC/19hRU/u8W+voNIsaAVvsyAaw8LUWaJqF0CMxgsh6V
         NDuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwanAqMOqWPdGh4s7zpJcL2ZWlQHthi8/6lLv3PO4A27vKsXByIBDj2J9vTtOX1Jh7oCHZEx9cy2DApXcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQA3AVVAFyVvPpGUh50Ex32SzqpFRvstU+1/IU3ZrUXBObIUv
	jIKHWz/9Nss4K1acKcsrRWgY91DcdKROMa3NOUmPgEieJaSvwsbYMqxJsKHEeKqrdtRKHIuWUFS
	sYi5am+MpHEEC2zObE6GdzYZ2hWTewC4=
X-Gm-Gg: AYBFou1hzPtSRxFRPyzqAKvF6GDRLBy0azk+KRkqz4OB4VFnSJwrDhxn1vBRhrAohIi
	KdIYb0y6PDNWsyOIs9wYnl2+YcCurTsBqRjEo9z6nZFv2bHApPSwusrTZblWOHi6ypT7fLDczit
	zWGsQR2cB/bzcld8KH/V9rswyWaC+JCqpAheDywxeKNYHk+kRaWHLdm4GtCsVZpVDSa/wZo+TMe
	TigP4otvBD2207As3oUPq67njzZIwVcMkdc4RiixStYWsjHis9i1negVnc+DCALkFz3UfeldA5u
	57mIivG032xkmQFfNkPatiyb2ALkC05+o+czDtptWbtgPjqwamLwOz+9sTDKXE0hsFqwHKZ6QM1
	srM4ZXgZPoyWyTsR1YrcP8pr9JvEg0DeCcNu4QCMCsmXLbUho1Ln1JvUp5hzdAHsq4zQAUJ5CkO
	UPAIbXeJGGI+l+RFnSA83MvIZBHGClkq3CT3YwiwuBHNMJjefy3okc
X-Received: by 2002:a05:651c:150a:b0:3a9:8167:62a with SMTP id
 38308e7fff4ca-3acb7b6498emr46627851fa.28.1793818466526; Wed, 04 Nov 2026
 10:54:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
 <CAP-5=fVtMnaoF1JbVFJuiRqPx-2izJafs=+ov6eF_PYFE9Xrxg@mail.gmail.com> <CA+=Fv5SO2NF6834Dq9pV5tdLrECnV4-1oNPJnD38+Or9u54eLg@mail.gmail.com>
In-Reply-To: <CA+=Fv5SO2NF6834Dq9pV5tdLrECnV4-1oNPJnD38+Or9u54eLg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 4 Nov 2026 13:54:14 -0500
X-Gm-Features: AclHuK8nm3ftnjmYgdiV6kBSrHAe3PMoyReSVVB67Kenr_T0JJtD2lmIa1lZRcs
Message-ID: <CAEdQ38FNa-7ELRuDN_N+Kw3eQ0oQ9WWQ==fFULKc50Bx4nCWdA@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] alpha/perf: add ProfileMe sampling
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:02=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> One detail on the wrap check: alpha_perf_event_update() also advances
> prev_count on an ordinary read. Should we cover the case where a read
> has already accounted for a real wrap before its PMI is delivered?

Yes, v6 handles it. When alpha_perf_event_update() sees a negative
delta it adds the period and sets a flag in hwc->flags. If the flag is
set when the interrupt arrives, the handler adds nothing but still
takes the sample and rearms. Writing the counter clears the flag.

> On prefetches, the EV67 HRM, section 2.6 (p. 2-23), says loads to
> R31/F31 may generate exceptions that PALcode must dismiss. So seeing
> no Linux fault wouldn't by itself tell us the access hit in the DTB.

Right. I didn't go by faults. ProfileMe's I_STAT has the trap type, and
on the EV7 a load into $31 that misses the DTB shows the DTB miss trap,
same as a normal load. So the prefetch samples are split into misses
and hits the same way, and reported as PERF_MEM_OP_PFETCH.

> I also checked the saved ES40 recordings: 344 of 266425 samples had
> both PM_KILLED_BM and TRP set, and 53 of those also had MIS set.
> That confirms the Python decoder needs the killed check on EV67 too.

Thanks, good to have that on EV67 as well. Tools v4 ignores TRP and MIS
for killed instructions in both the script and the C decoder.

v6 adds the wrap check as a new patch 5, which shifts the ProfileMe
patch and everything after it up by one, and most of those changed.
There's also a new last patch from Ian's follow-up that lets ProfileMe
events take exclude_user and exclude_kernel, so perf record works
without root at perf_event_paranoid 2. I'd appreciate another run on
the ES40 when you have time.
