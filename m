Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596719;
	b=wcOrLIvdrpzJ8+nFfuOv8nWDL0iSaS5SIpOGmm4dBpP3sTjadvMwwQHnOLu62T0AD3cP
	 DQAsP8vG9RzSQtn9WAXDLUvHfyk3I05HwHGAVFi+HHdkkSqYL97qjtV3dlJlGNOCSHa+f
	 RdAmmQTmAXnHCZEr01+3W4tqgBkHFWIstfcPaNYC2OsQmKqwocVW0rFeIqqyb/KDN6x1z
	 E1B5L3B+o0qbzJTg6E7CqwRJItMhK0W3A9KJo28FVYjHNsN0dJ1pOYC6iW1Z/KkcsTEUx
	 xgAcZ1RK5cZDV89W5wtHJHN1wyPrOKfB/woZMM1Q5ytWZv6qxnohMQsoTlrmI8NWP4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U60Jt81TuPOI1PeKasuheW/i54eVEfO8tEZphtbeDLA=;
	b=4+xC2mJrkASo9xe4zTv3YmroY0WTESDcrxWln3veUuH+6fszpOEp2IET9+Q3YOZmqAOk
	 xCyJsqnVfjdWpof7+smSitM6i+e+J8QM4SeBnZQBoQxHKE4Aef177L3fjEYXmcfwJ0DdB
	 gKvfBykN6+rtO9h0lepf3VaOA2oNBjxhyKAgSGMSwVxd7/ZNCMW5FhLihJBG+4yyYy+4H
	 wbnCxfK/d6T5MR3R3xOkUOzf+FcjlY73Bhfth1YjJgxOAeGAaQWfGQDMBTF1Zs0oYHL9m
	 NMWD6ReA4SvlQfuFQ9d/9Lly+2swIxM9EKduU2iR34R3xmGYp3Ygqyd2cyEIe9V8sPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=GTCTxvWW;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621B606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2621B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=GTCTxvWW
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0db268bd8so5558117b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792596718; x=1793201518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U60Jt81TuPOI1PeKasuheW/i54eVEfO8tEZphtbeDLA=;
        b=GTCTxvWWN6taIv1gq+jX+lLGYuJaKpoETO63WPtwNtbu2bYi++1sBLFKypCjniXV20
         fdbTQP6tghJg8x7Xw/VynSmxQarpEr8On4ba8zvFZVAmLjqRgAsjehjgunr5S/guZBm4
         N4QPCWQDWWwf2vNncf+jsqJPTkgDj31iYSWzYKk8twHGE2fpRQVtvUB5iZ7vznvRzEWu
         XtKbhM21uT/+w4qNsXIq5WGI1k9Q2AYWX03tuTOFf2euJ/lv5AV+Iy1nmvkqQNVO+8kp
         LH1nilrY77Fmz3H4kGoQB+L/IgfqeRe0g/knvHxgmBpWBngXIpuaUqqHwqxXIAF933SV
         RNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596718; x=1793201518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U60Jt81TuPOI1PeKasuheW/i54eVEfO8tEZphtbeDLA=;
        b=sWXKObduJze3RnqSptfpoSSRgB8yiZldgM88MYZv+xexM54KF9P5Gm/63sCR19gukT
         woV/WyFU+ztAMciP+ixfmtMjtMuwA4dc/sefXRZGUEZc/4H0lCGWWUxrx4Xin6n2nmd5
         EcqoiZMabxKUPGOCy8XzYdXXheJdRQDHty4s764Fz2RmPJxK0lzaQdOKVG/Z06IzX3lg
         Qiywhw/ovl91qV1nBnlAe5iuFyJMR0iMYDBHh3FBc+A3E1O3nhxOvvB8vmNXzCrZuKJQ
         B3KxK3AoBqXMhEuTFj9HxvnRrPhuOevaX8yfXqOnTxwZxuagXA6J3GIKmzQQUaDbJqcT
         Yx4w==
X-Forwarded-Encrypted: i=1; AKwUvBzEvSOXUXn5i0Hbp/XNfwMnesre4lIQ2UR2rsOFJDCiRqfnBAyArRfsjFdKN09KzZxmwiQYQVjj9KOhPi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjSl/UIU0UNkvMu/hPpL6/M0+5m9B4VvSm58cO75ECE6oJvD/h
	Ujm0JJiRAI7FSOb8naqEojS2nc33BkwQ8hPGN4eXVUrZhxO1CGWSLs1WcIWz18se8g==
X-Gm-Gg: AYBFou1QfxYIEwYS3PzHv7dWmpqwXmVRC3kvJvOMXZGIfCTGBeFEzsmmOCHKXBm5dVz
	DpUuvOnSiAs9Ybgdr6EdEG2VHhmJnl87BTcbYF5lU3mE+QXZGC8KyO2BWMKRH7EuHPhTt8sfO5e
	RUdfKNQyNB5vciY3qB/0bVjfD/rRgxlJZ9FLnZi517KuojEqFcbe1FuXwVVOodWneOW9dUPZ0gB
	A2EX8vfphgRWRaCVd8Oc9X6ZGuW5oD0F/7CUqyhqwqqbOjX13H0vUuA2MgiwYJMflyRZutdGAwn
	YF81N5GACiK84Ba3ItG7ILP5fd7JJBOpvuRL8EhRvwevqvsyRm43DCLNeqDD3TVJigRMR0nclev
	GYqfCvchPGUBBbqTG0VJWPY1TcF3IH1kMgTEwkVGmLtovAY8JuyboX7yxw3cGrkOZEcNBk/2d/J
	2FLWvq4uhUG5STFus2VI8zQv08WMOqAiXn+xuQ+VQs14n9NbOb52FsRaD6YFdHdvldwytLHzplW
	0iFulx6MZrIoKP5cqkyoQ8cEZZjmAp9ZiFeTmSGhv1vXHyHJetP5glZ2CgkBSd/kzPehB9EXrdR
	Jg==
X-Received: by 2002:a05:690c:4804:b0:8b0:c673:993c with SMTP id 00721157ae682-8b133fa1b99mr11730777b3.21.1792596716533;
        Wed, 21 Oct 2026 08:31:56 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300f3cfesm13054287b3.27.2026.10.21.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:31:55 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hfs: avoid reusing occupied CNIDs after deletion
Date: Wed, 21 Oct 2026 11:31:41 -0400
Message-ID: <20261021153141.311425-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b6f1cb66778d09015ad5862ff273edc37c44ef28.camel@dubeyko.com>
References: <b6f1cb66778d09015ad5862ff273edc37c44ef28.camel@dubeyko.com>
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

Hi Slava,

On Mon, Oct 19, 2026 at 04:29:16PM -0700, Viacheslav Dubeyko wrote:
> Frankly speaking, I don't see how your modification can fix anything.
> From my point of view, the current logic is correct. Probably, the
> call of this method is not in the proper place.

Sorry, my description was not clear enough. Here is the reproducer
with the actual CNIDs, on a freshly formatted volume:

    operation    allocated CNID    next_id afterwards
    mkdir z            16                 17
    create a           17                 18
    create b           18                 19

rm b calls hfs_correct_next_unused_CNID() with cnid 18 and next_id 19,
after b's file and thread records have been removed. The catalog leaf
records are then, in key order:

    key                type           CNID
    (1, "untitled")    dir              2
    (2, "")            dir thread
    (2, "a")           file            17
    (2, "z")           dir             16
    (16, "")           dir thread
    (17, "")           file thread

The backward scan skips the two thread records at the end and stops at
z, so it changes next_id from 19 to 17, although a still uses 17. The
next create gets CNID 17, hfs_cat_create() finds a's thread record and
returns -EEXIST. The correct value is 18.

So the call site is not the problem: the records are already gone when
the correction runs, and calling it earlier or later would not change
the result, because z still sorts last. The problem is that file and
directory records are ordered by (parent ID, name), not by their own
CNID, so the last one need not hold the largest remaining CNID. The
patch keeps the call where it is, so the drNxtCNID correction that
generic/736 needs stays, and only makes the scan take the maximum over
all of them.

The unpatched run in my previous mail matches this: the first create
of c failed, and the retry got CNID 18, so the failed attempt had been
given 17.

> I don't quite follow why do we need to change this check? If cnid + 1
> is smaller than the maximum one, then cnid + 1 is in use yet. We
> don't need to execute any additional logic. What am I missing here?

Nothing; both checks return early in that case. != additionally
returns early when cnid + 1 > next_id, where the cmpxchg in
hfs_set_next_unused_CNID() cannot succeed anyway. It is not needed for
the fix (in the example both checks go on to the correction), and I
can drop it in v2.

> Why do we need to check something for previous one? If the bigger
> cnid is in use, then we don't need to do anything here.

The lookup only runs when cnid + 1 == next_id, i.e. the deleted CNID
was the largest one allocated, so no bigger CNID is in use. If
cnid - 1 still exists, it is the largest remaining CNID, and next_id
can be set to cnid without walking the catalog: in the example,
deleting 18 finds 17 and sets next_id to 18. Because the fallback now
walks the whole catalog instead of stopping at the first record, this
keeps the common case cheap. Only if the lookup returns -ENOENT does
the patch scan all records, which also covers files without the
optional thread record.

Thanks,
Hengyu
