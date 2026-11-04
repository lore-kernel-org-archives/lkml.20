Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793758033;
	b=OiqVze7wQZ5GjoIWgw3+yjN1vKpkBsT/EqT05BoXCXxKLjVkE+GuuNf5LLkTX8qYbV2s
	 65jZL/SEWM8y4mJkGXUDTRXkh+0+N9ANH1EDxlQO0s/TuHSDY3j2t2QlXzQM969Um+Axf
	 dzWn6bMk9HLDFtDQR579MLQL20G3tRowbBbMDSV+V060LKkbeS+8gYLa4M14g0xfJmZXm
	 2taQVOeiRW/4Z3QVlBdqEVMnLpY2VqoRXy3kvfbho5Z4RUVmSE4VfH4Pk9i/6ZwLkG0hE
	 eWzu6xKd1Qv3aIoPgrxlgPecuaTXVaj3mN1g+AqQX85d44RcSKs1k+ttPRFvmXoifgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
	b=hP+jBnYblH1TJ8CK9XAokBesPhGV8wm8i1/hdkW5APz1aNy/wyFgTT+ZIIcxWR/E5rcn
	 ar9ylpojJeZX7cfRdBhce6R6j9aM/oXAm6i44i+6cCshvYAFUUdrnZSaG5rm2+NBzQ3B4
	 YB1fJXN8fQS5ckKmVklYu4I6tClpHzjHenbaspznukksUInm46Zyz1Z72VmsxbRm1cprD
	 mS4qjfz2gGE8aydmbQDySjV75c2nJUgfl/mjjjEr+dw0E9lv7en5yzHwNGRGQ5cwN6Bjg
	 RDZcBFn7Pw+2q16WRmsJ92UKR4rOXw/BHptL1bV+NdoeTN7MoPQ/M87NH5d9K0JZb5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oThg68Ne;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766C606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9766C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oThg68Ne
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5383c97c8cfso80961cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793758031; cv=none;
        d=google.com; s=arc-20260327;
        b=RxAaIA6SXf7R0UwF5eRpMzxatoGqpB55nWMRiCm5MAs92oPSeAg/fkNiKyXu6ELezL
         Dwqt8oSK+UkCwxcfvdiAkNXC0ZbzQjxbrl9HjyXTFO027WbTMbl44rPC+dC8PdGu64l7
         qc1mgeM4h034akCd+qoIWvm//kzq5KceXqh4iVyg9X83dYrVE0QlsayJZhA/FyoimGke
         B7V4pBB56McsozkUKx+Gzu5lq42QQYHV2Maw0lRh+eqF5ja3CA620g+/L/12dCXkKjpC
         fsLQUCAHIK70gpEq7j+VdOfvCnrvSfU7Fhu56ozsjX88iOG/cTOTI3ecqcnclzAfqsIv
         tRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        fh=cvvrJ1KFmrqrKuFf9ozUaICF6pNF1ymYGHVd3waKQrE=;
        b=tCqVpVsoxNcuMe0/EUua0WxuTl4vg+b9o+SoGzv9iBS8zOcMGqvtRQ3z5wnHN/fLyM
         +BVTzZPzAZh7hrUMVCYib0lOW9SUjNU8zTv2LnMHz7kZ3URTKw+2DTFlfWYPWo9JjgRs
         q7U23jA3nk7aXTMagOb317CiMveHEikBb+6sKwnLqtc4vbRpq4KdWYlChWIlEIDK57C+
         vW+21ZsBOB2tWgH0HALVgTT41xNufgP0yb9R6tuQ2fYHgzFSmEKp9vhOnkuU+042zijG
         oesH2nOjXLTAsYcQXHDuZpXj/m0MvCY/EI3dSLMySEKG2Xl9/n/bwtpuPTVF7rllevsP
         hTig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793758031; x=1794362831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        b=oThg68NeAuAARxj0DnZWcdHzEFFOAf0PhW3bKiH/F3mQNcTunu3cmWSpjgvtgoaFG9
         7oRZKXWcWGcZ8XN/dsugdtY0p/wb+GKC1IrXjpW6/4jzRSXrJe6fidHCyhPK0xZ3a8+f
         5KIxSWC3moVqVV9Kbe6kbCK5/lKA8Q4MxhUnrxfLIHtFDRKAkLsSW1d5y08ipAAtn5E0
         1LfL/XUUYc+3Z2K0Y6NqcQEXLQ0ddRct9ry/sGwy88E27SbuSlm+FDGsZHSbjW5l1RlB
         HQfW2gTbk/h302ann4/Eg3oX+hq6nk0Tluy4VIOcUoJqhcQdivHGnQxn2bzWu9XCh4P2
         d8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758031; x=1794362831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        b=UQdyQnr22y/6rZjtr4KDqfT+cWZ9Nfgg/zC/u+zycbjOQj2MAB0poTda7B/bUg2pyK
         nVOsQmmAlQEC2ZDZaGkLegBHE3IhPG2Vl0ibkC2L7nNwaVfDoWJlNzX8P/44Up6YIjPj
         cbQkDQM7NVV8Jhx/PpntnqPElPLgcKoU7nmMnF4FRyMoElKX53qTWIUKyaBgBEGLL/uP
         eSKgaT5vlUnSW3CfwKcbNB80rdtGcbdxSybhFRpwQNg3H2/MXg2voWQ1NCK9d8yCQcYS
         duONW0pAe4osd89vbtqwRJj7/hJVMWYfIt2GJOdi823/70f5q9YfWQDhJEk+A44TDgSu
         nILQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSPuY99zj4OlBy2MJhyDSXpAgIV3LMqlNRRbdnZBIlvA1haKFQ3VwezKEkrp/yBTUdFEz3RQ7OsPJEUoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OBgGYbjYAkESs5V/IN1tZu81ywmLaL5EQVFmzO60+wNi2ZAl8
	xAzxhvg+rLvNoSAnkRAoqFlBBDuh3nvSenUedMAgsZ1wo/uUv4E85Q9j+6jAvl2f1KhLeYYlyTK
	pBAgezCF3D2aHXmnhcCaayqznZXN3nNR0prQC6rX/
X-Gm-Gg: AYBFou01RVagU2SPXxJdDIs3aptZHOV2N4M0YAnB81hXZocEldbiMn1e8t+nAh2tnN3
	xijrdGadBZmFDAFGfohVdh2rt2jziMB4Hu52X3qw8hvUVPX0nPsc9z/4p4nBvcZqc1hZjow0BNW
	F9EBusSkcfPhLGOFyIP3eran4jI9XfpIbVce0tgLxEoi6xIBUCk4/b/EadiyzlquV5MQ2vDl0Ug
	xUaK2OMhUn+UqC6iZ7FAUOXy7SSgIlhEvTXInGe4QQB0g8wHkDjCNmt5etIqhRO+uAsbuqaBvZh
	ACWewzTkUayU2BPqHt9LFUDJKjnY29/OSz7SeCyRKei419bTgbdIlPfLBWEu/Kn8VIijrFVf9JB
	ZdHCKUiaZis+X/M3jrdz410K+9ZOse5Bv20DOaoo5CZLCA1AsIfZgXsqG/r3YiZaTdyGtzp1s8r
	GOJHhcC3naF32i
X-Received: by 2002:a05:622a:4d86:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-54b227f261bmr9698371cf.0.1793758030925; Tue, 03 Nov 2026
 18:07:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
 <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
 <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
 <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com>
 <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org> <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
In-Reply-To: <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Nov 2026 18:06:59 -0800
X-Gm-Features: AclHuK9a3R3Bk8Y8NTBpy7q1LcP4CVXMf0d8lIiveKtvu79UpNEuQo-0lJdArDQ
Message-ID: <CAJuCfpHxk3nAnH7xsqGEtJFDo=ZVWKwWfmck5fSvuLmnrG647Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 9:21=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 9:01=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 2 Nov 2026 08:15:47 -0800 Suren Baghdasaryan <surenb@google.com=
> wrote:
> >
> > > > Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> > > > complete fix looks fine. Perhaps we should mention this pre-ARMv6 C=
PU
> > > > detail in the changelog of your fix to explain why READ_IMPLIES_EXE=
C
> > > > is important here?
> > >
> > > I guess I have to ask whether you want to post your fix as a followup
> > > to mine or if I should fold them into one patch and post a v3. What's
> > > your preference?
> >
> > yes, please just prepare a v3.  I don't think bot will be offended.
>
> Ok, I'll wait a day for others to take a look and will post v3.
> Thanks!

I posted v3 at https://lore.kernel.org/all/20261104015447.363602-1-surenb@g=
oogle.com/

Pedro, I confirm that page migration will not change Rss even
temporarily because pagetable changes are made under the PTE lock and
smaps walk takes the same lock. It will see either a present PTE or a
migration entry which it also counts in Rss (via
smaps_account(present=3Dfalse)).
