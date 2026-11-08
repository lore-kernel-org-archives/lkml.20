Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142826;
	b=lSyEm8MeS/Tc8opLBv59bAxs2a2IbvfXtZ1Anei/CTB1VkzjICZxj01L48DvcHZfuZdw
	 7+pVmOIXFIK5BTWfJiENWJ3gLEZp0THdrGXoHrS26zty15UrTosIr0230RSgapmzXIxJf
	 auRStwSeAam9Cl5PQQ0H6i/k7M9lvpE0FZ2g9akCK/XXYSAC7qM7znMOWn7X+T50uTx49
	 z+n0cEh2/BrVj4OT3E+v6W6zpvdc09YCa16Mih2xAMJ+VJiw8ZTfwaQ1tfm60Hf89dmhC
	 jv/XcZJpk71QOGJL2UUOZRjgL5JjTtMBaSAV6Clqyvg8bbxNIi/YN6+4YGqdVIWhKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4mJGcnbOikGC5pyvD8OjNMA3lgdYXd+q6xrFutVPm9Q=;
	b=FZ5z0ahXSdi33AUb24eU7RC58IrTYOA0enrdQcPyFaRaxaxJqwI6BV/YuHwOJmI9Rv23
	 hO6ismAtB+b22HMv3jx0lgLXf/olKhBOYftyJf5Tgn4w3TaBVrfATyjJ8yTs0RKYmjzlH
	 E4qCtihNdl0SN46XnPMK2Vica56Xat0Wjg46RS+111UAphVlEfBMJf4CmDTBzbHaH45Mr
	 OY5KW5CUENFCgxHcZPzootpXlDWPwlQi2bnv9ap6QAssDAZWo3YQT0JYNo0nrxQFvbG4B
	 8Ce/hfNJ5ig90FI/WqM/FdZiTpxtdt5S0w1zGS+lnxR8JO0RAbGMkOeQf2vD2uirhHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEt8TNJs;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CCB606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CCB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NEt8TNJs
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso32180a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142826; x=1794747626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mJGcnbOikGC5pyvD8OjNMA3lgdYXd+q6xrFutVPm9Q=;
        b=NEt8TNJs6JP9BoXDg7rnJ+F20QyQc5NRQYgxlZU3sRUoaXEv/IVzqnWWf11uu2V+Ai
         lUtYTjuUCXGyyKbyNm/GqXcTa2jBPtl8Vwf3wxfZLFWQKYlo/8Xq2vAS3TN/UiM9khAo
         wnTZMpNN3nQcGWQ24x5ug24PXi8TuVLglrn6ZDn30jefoAQcOvkG9W3U7ZH1/JDfZZF2
         iFrkHMtTrYB8iluJ//NMdY3WnbHEevvP3uTLOByq34K+/TOrpSDQx3HJCFOgo7ZmJXeq
         I4EKrPmGBK3irLqcv4m9LsU/jvmqtbiHS3AIb/LbrMuZl4fwxhcHsoMSuZfF3VVvquzo
         umdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142826; x=1794747626;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mJGcnbOikGC5pyvD8OjNMA3lgdYXd+q6xrFutVPm9Q=;
        b=XLwmat0B7uA8QWAVnMj2JeUiCz/fIRT3BBIE00GNTs/zTQbQx94UMskMCGGeZkU9G0
         TaVppqTDuvWBqvsvNAAEMZd06MbijCTxT3EakQNz2tkTPPGwho8mCsPzoTzxyeKRgM86
         XxQ7MKyTrWnX7JIK3Wdm1enkg/NmIHFrYYyYwggxe/FwPGws2O8y45pJSIfgs/30dggx
         fIHo1WjNtaWk8rNpBZnKaCj6q4y5BYLc8dNCaIN8P950anIWMKCDJJATJYJ7qxflodSB
         Znif5xiCKf4J5iBzX/jU03UpXiBY8rSF/EoCF78bE32R3POcKO9QKoIVGn0L46t3BT1S
         3zow==
X-Forwarded-Encrypted: i=1; AL+hErHIHHwrrlEh8UmqwBAeck4O9P0Yeg+JK5vEULihHCfchMLZW/HTqZIG1XTgJcu9ho/KDd79bERYk8l63l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tj5nDtcwpRE6Lewv292g3V07SdnzXBu5Qc7bX16eaKDnEBEW2
	OrBsWWKWvg0W0iIiQa39gOwhIl0fB2VRm+Yt4yvdo87YUpz8iUjwnJey
X-Gm-Gg: AYBFou23MeawKitKk7h9L0TkdaMCcGJET5IgSumsIxrcRIXWyqDBBHa83SSot07ykt1
	fw48pgWAovnpZZpU3j6h+StGK4oQSCv0PV62kC+UyQEpkeozAnYTXhLpqhv7R0ikN0YxXNv4kaX
	HMHjpUtaXtA7v+jwPZWWlEzBwGuVlu+GEXq+8o/llL+Z74KDUOLFuIVu3qlkQF0cV5JdHbG0uyZ
	jR7+Xd/hC4C+yoJde3idL6TxJO9jJyRf+/lzwVFHPrFGT5UNd/zS8VkCgk9dQd9X7TeIuR/M6/O
	vBnKWIHyz5Vij6L9QhBR7EmktLnoB2E6Nb18swChknonMYdJhFNYXpmX60jSTD0v7zmuGkSoCew
	3oXdEGk2WYRNYBHBCHdqdrczzqFzkmLEr2ii38lbzfqqRtXkTz+HPYkMV+SP3xVSVnS/AJ6K12F
	qNoVKX44X+xIg02p4MYhjKwh//l//FIt4sLaAGstLjSKd00vdHrTv7ePB5bq5TmZUlOlNAXeZph
	KXpBB01WRfaKoebwMeT0uSIYAQLjuA0+fYaG9z5qRIPv6t2X4kzhAdgfcQc2sFJd91xcuZ7m/2Z
	g6nGiJkGpS7hRxvMaT8U45RAO/woOBp7u6rR
X-Received: by 2002:a17:90b:3c8f:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3b12d5d4c16mr1111842a91.65.1794142825530;
        Sun, 08 Nov 2026 05:00:25 -0800 (PST)
Received: from ubuntu24.localdomain ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127970954sm2986180a91.15.2026.11.08.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:00:24 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] KEYS: Protect pkey method checks against type removal
Date: Sun,  8 Nov 2026 20:59:31 +0800
Message-ID: <20261108125932.77081-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <au3fT5HMq7IF-M3e@kernel.org>
References: <auy1ANMSKTXZb8GE@kernel.org> <20261105193632.34363-1-0xbeac@gmail.com> <au3fT5HMq7IF-M3e@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 04:08:15PM +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 06, 2026 at 03:36:31AM +0800, Yuansheng Yang wrote:
> > Remove the key->type->asym_query check from keyctl_pkey_params_get(): it
> > runs without key->sem, so key_gc_keytype() can retype the key right after
> > it.  Instead, make keyctl_pkey_params_get_2(), keyctl_pkey_query(),
> > keyctl_pkey_e_d_s() and keyctl_pkey_verify() each take key->sem for
> > reading, check the key->type->asym_* method they are about to call, call
> > it and release key->sem.
[...]
>
> This is a transliteration of the source code changes. How this helps me
> to quickly understand them vs reading the source code changes and
> skipping this?

It doesn't. It just repeats the diff.

> I'd like to know what is that you are trying to do by doing those
> changes, which is the higher leve question. You should know this
> already. I see pretty much the same thing done for those sites so maybe
> that action is what you want to describe. Action taken, why that action
> won't cause any harm,  enumerate the coverage and address that it is the
> full coverage.

The goal is that an ->asym_*() method is only called while the key's
type cannot go away. The action is the same at every site: take key->sem
for reading, check the method, call it, drop key->sem. The GC needs
key->sem for writing to switch the key to key_type_dead, and
unregister_key_type() waits for the GC, so the type and its module stay
until the method returns.

Why it does no harm: the early checks stay, so the errors do not change
unless the type goes away at the same time. memdup_user() and
copy_to_user() stay outside key->sem. And key->sem is only taken for
reading, so only writers on that key wait for the operation, as they
already wait for ->read().

Coverage: nothing calls ->asym_query(), ->asym_eds_op() or
->asym_verify_signature() except keyctl_pkey_query(),
keyctl_pkey_params_get_2(), keyctl_pkey_e_d_s() and
keyctl_pkey_verify(), and all four get the change.

v5 describes it in that order.

> The above looks to me as if someone had literally prompted "translate
> this source code change to English". Neither much effort thinking  done.

That is close to what happened. I used LLM assistants (Codex and
Claude) to find this bug, while looking for other cases of the
KEYCTL_READ problem, and to draft the patch and its changelogs. I
should have said so from v1. The v5 changelog says so, and what they
were used for. I have gone through this description myself and can
answer for every line of it.

> > -	if (!params->key->type->asym_query)
> > -		return -EOPNOTSUPP;
> > -
>
> I'd drop this as technically it is not part of the bug fix and then you
> have pretty much symmetric action. Helps at least with the description.

Agreed. v5 keeps that check. For the same reason it also keeps the early
asym_eds_op and asym_verify_signature checks in keyctl_pkey_e_d_s() and
keyctl_pkey_verify(), so each of the four sites only gets the
down_read() / check / call / up_read() block.

Keeping them also fixes something I missed in v4: for a key type without
->asym_verify_signature, such as turris-signing-key, KEYCTL_PKEY_VERIFY
with a bad input pointer returned -EFAULT instead of -EOPNOTSUPP.

I'll send v5 right after this mail.

Thanks,
Yuansheng Yang
