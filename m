Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24124CE679
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282364; cv=none; b=X+NwdPjHbCbVwFc5lucVlUNkw6HCP1ud75Xo+xbK83CrsNU94dm94JaPHbsROmH1Ymddp07ns+NXnMKvq2l50jFqOJXGvYr0dxscUpWVJ3cL1JsN8F9I+BHvLglUxtxnEW9qfga5QYXRIe2VseCukF/9tASBI2B3W8pxc/qwDd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282364; c=relaxed/simple;
	bh=TSgTzBxTBaErp0Rwm9IWaRiQscwVhgUXab2KvhTnuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVlD8FTts7GHVlujY/qic802IG7U+Rn8SHS2o6NtUZ/rRzgiY3DCcG6v7pRRm8KoZ3RvClN09O+DcBXbU+3qpCoghVtUdLznZ47Uw+I5gdMrfyuYkP63uyPPtdf1bIwYI60iewdEl8omsNwyepK1xC0fb7Z8xmbBlwxujCUly8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDTw8F41; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDTw8F41"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso147925f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790282360; x=1790887160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iop1aYcOw6anN1InXwODk9bRtXPmRstr8biAWMMaEEg=;
        b=rDTw8F41k9JIQiCxW3RG9bGxPUQH5VVcRgYfwChifj8X2sCH5RUEKhzd42xQzyncql
         CogOTaK1aRZ0PU9ySOU3pdAYG1wIoy6J3VGNbkhECTLB6vMiBfNfw15Vh7Expw8TK0ZZ
         FSa9S4pi7cAUfZSpyMfAGSnWgXn38mTT7HC8CdHnXZo4tcmUrWsdQ2YcitnPIugy5GYN
         kRsPyURACojCodwNS2fX7mvnve4VZ8emofvF/8Fa7hJOSTMQm94tSf/jLKB4TRUTNArO
         bs8uEPTwzRJSOadOQ/vIysUIcHH1TQUAYNgadN21JK9uW87JWAiQHdqs+kFuSzCCIY4/
         moHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282360; x=1790887160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iop1aYcOw6anN1InXwODk9bRtXPmRstr8biAWMMaEEg=;
        b=hzdRFxMon5HNg36OGN2f8F86ASBnylwOum7c9hVI4mrvFpk2nFrqhBMoP6kjd0pKqt
         vPzvYkL1yaOu9nhp7NxJUemNupAWyi5UN68s+xeVzdtP1zxk6gLNFZBsoogg4CzH+4DI
         FEwjnnbRC7bUpEGP75SVRh+nrCROJFvol/hdo1gra+Sb3LH1q1bH5k5p87DvrM/4UalP
         kP+rYM3w/strGt4u4bHsGo1mRNYFTJbvj+hP0TgJhFK7D74Bcekw0YB1CUqd24o+2+/6
         CRdB3ZJUPhKQHjWs62AgZMzWrOLA+8LPCZBaLFCBTDl4TMTDw9Gf4knCQQ/3jowMKoME
         qvIw==
X-Forwarded-Encrypted: i=1; AKwUvByKwYAv+CxVfnlsavoh39gbA5++oFFjonxya1VfXxfbN9KjH1XZsn/ZLdgxi8JRMdKEznPnaihwF3rXTGE=@vger.kernel.org
X-Gm-Message-State: AFuF++l0fxU73pBcDMfbW4Cv2WTnYNPkDKBDo77iV89VYPHRvn5CdIQh
	/HLa+O1xDsGhKgRoHd+ELUo8tG+cJibnLrLcn3e3UK2n0oLkUsJ4eSWo
X-Gm-Gg: AYBFou1DS5j9Fhut2tBtDnqdXYvzrSso53ChmUT2NB1klztZQcCOAZmA8JdLk6k0vKE
	OX/X4kQXIXh6ol5NC9ilOWz953J1ibjusCNYwJoYNUwdPZANOdLRy2sdFfUNBAATKGhEvqBoHTg
	csjXgjCNB6Ut/CyRsEbHv2QsBuT+96+4e2QYkA0eFkAkRQ891WYryXflPNBHjZ0VxTOVPnPpg0y
	zVQ9zak7tYhnehYbPK0VVBnwIZP5j362W5eQN8/arlzDnW97FtiSf+pLmcbo9NYDBE8KA75YiOK
	/RJT5gWD2Wb+PK4tDGBYNitJz38Q4EHJC+VjApiRKf7FQ90jEmIYSjpAtFJ3GkJ8litoy0KgXAL
	pJeNEJ+RecVNeNhZj7E8xTHsX3oihtvvArkgtvzrE7OYAgTTFK1vGT1byGzjOvHbW9WJjzZMBLn
	/NQ9paOm1SVHUDpBD4GuK4XBcQDLuTtlL3yGJIKSVbwZ93Gp+7LrBw43JzPPuUItYLNiVDQ7FAz
	jrA8ivmEF/fuswhQnnGroqTGWrPidiWQUTHo6JpKsoDDUOYym68+8Io+9z7AynpSYeYG37pGfT5
	AMN1Ew==
X-Received: by 2002:a05:6000:703:b0:486:fb08:2353 with SMTP id ffacd0b85a97d-48872abc9e4mr6181199f8f.31.1790282359492;
        Thu, 24 Sep 2026 13:39:19 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm1408491f8f.5.2026.09.24.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:39:18 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from pud_free_pmd_page()
Date: Fri, 25 Sep 2026 01:39:15 +0500
Message-ID: <20260924203915.189167-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
References: <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/24/26 10:21, Dave Hansen wrote:
> OK, I've got a version of Mikhail's fix with a changelog and comments
> I've munged a bit:
>
>> https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/log/?h=pmdfree
>
> Does that look OK to everyone?

Looks good to me, thanks.  The code is v2 with your comments and the
declarations reordered, so the testing done for v2 still applies.

Two small things, both optional:

 - "The new mmap_read_lock() is held over a GFP_KERNEL allocation":
   the lock held over the allocation is the same init_mm lock, but
   taken in vmap_try_huge_pud(), not the new one in CPA.  Maybe "The
   huge vmap code holds the same lock over a GFP_KERNEL allocation,
   which is a no-no now that reclaim can take it."

 - The kernel-doc lost its "Return:" line while the function still
   returns int, so kernel-doc -Wreturn will complain about it.
