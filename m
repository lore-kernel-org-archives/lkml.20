Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1B3F5BC3
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027533; cv=none; b=q09NlvxGXJPv2nltoYP0zYH9rHGEA78IBW0AbN+3jB7pAD8LXX8xeCQMKzug3Jl4NB44pRDHtN9521hkXx6zlBXEmsm+x6QrObTQR9Db/QBNFhZwNOb1FAY7pd9ZB0b0mfV5rvNG7qeV3awwOykie2HvHvHiSrRGoWJBBQLzems=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027533; c=relaxed/simple;
	bh=wFuneSHZBn6In4dqUVxijnRdt9U4NP0mkaXqbu76nwk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r5GgC5G1AQCURf4fAezwv9KTKcq+Y217mbOZOdJaN3ZlSZ4kMyAnt/niAfJBopGQZUjkvrrBbpQB5Tj2vMEr/z8QvDQFxdi+xDu2pvIwkiZLTg4XYUlppVglg3J7VBDlbsKeh3GRWA80JVUu8x8+Coth9S9oGfWBWHm6d6LJL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0JtvTo/; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0JtvTo/"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b00febba3so210773f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791027530; x=1791632330; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l7ARbE8UXnS/98aYzt9PQ09qeddpRzbILa5zCOGi5g=;
        b=A0JtvTo/xMkrZOu+b6DFr2sC2SDpHStp3P1GhQ5M9hqUGS39kQm0FV+SikPudYs3mC
         9dWB5J18HPp82EZmsBa+K5IoA1DGt3LwP05kFljuabHMrgsx5aSGzx3UY607g4nAaGMO
         aIxsybahj59j87emLeVf+Bck+cMYjg8ul1NY7B2wHNFIhgZgFZtvQ2p7pZmI6wJYoMJI
         ZppSinv7l+QRO7EbZpdQxWLeK0fx+3jW1dSi74pzzBgQFPsSRK87ebx0Nu5Cwt8KwBYh
         Vj5bOv0Z0i67/g2tFCPx50MKxqO00Q9REZw4mNGZgFhX87NJLYNG8JMLLfV+tcWUgwTF
         dOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791027530; x=1791632330;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l7ARbE8UXnS/98aYzt9PQ09qeddpRzbILa5zCOGi5g=;
        b=Hh2qqXeufo4MLSKHfiSJoYkCsFhripgLONDBLgHxnaeuClqvv0YnGUivb5GWbJpp8d
         te5eXN1rXvKGsD9XZ9IpCG4p8LldtDHkhpRcA8NY3Fe1EWjbpf74quRByGxorTbqlJa8
         /toeUY0mH23QzOCSEnZfCPolnzoa3JBDBhOxcz09qLF1YjrL1nzqShhHJfxT3oFRdIRX
         kKuC0bqBvC416AVksBWO2Za99sxnyTyGsmtVvRMhbiAbop2yiSdNoxkuK8oL5UsyaznQ
         PurbXohN4lspGIqzxeRf/45oguHQOn11iZuBSVaNpa1JsP64BG6Sd1BGlinYAnUj3o3p
         z+0g==
X-Forwarded-Encrypted: i=1; AKwUvByViaruGa+JHNejvKNdJzMAdOx6f3Yqd7Mbe1oHXC7ls0T6GI8tpgRRdXG2zbaMd4fVWCfY6pL0Id3NVwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgwTFLDPNPkHltfG2a16xN7NnuXn4gLWIOAMo9pRO9YJ7/ttDi
	gOS/Pr+ZnknQBuJEy3pxbzl1F2IIJw2Olb4tIlL9JxGnDfJZyiR4tqWLhcOpDXPBXObF5LWpbfH
	jFb4FjcnFh2LfBA==
X-Received: from wrsq4.prod.google.com ([2002:adf:fec4:0:b0:48b:d675:3474])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400c:b0:488:894d:20b0 with SMTP id ffacd0b85a97d-48c4731c267mr3325758f8f.44.1791027529399;
 Sat, 03 Oct 2026 04:38:49 -0700 (PDT)
Date: Sat,  3 Oct 2026 11:38:38 +0000
In-Reply-To: <86a16fc6ea0a57cea7459ac2ebfdfc1b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261002205242.3820674-1-jpiecuch@google.com> <86a16fc6ea0a57cea7459ac2ebfdfc1b@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003113843.17313-1-jpiecuch@google.com>
Subject: Re: [PATCH sched_ext/for-7.3-fixes] sched_ext: Generate qseq from a
 per-task counter
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, David Vernet <void@manifault.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

On Fri, Oct 02, 2026 at 12:33:27PM -1000, Tejun Heo wrote:
> Maybe wrap the counter where the QSEQ field wraps instead of looping?
>
> 	p->scx.ops_qseq = ((p->scx.ops_qseq + 1) &
> 			   (SCX_OPSS_QSEQ_MASK >> SCX_OPSS_QSEQ_SHIFT)) ?: 1;
> 	qseq = (unsigned long)p->scx.ops_qseq << SCX_OPSS_QSEQ_SHIFT;
>
> On 32bit, the shift drops the top two bits of the counter, so the mask is
> what keeps the counter from reaching a value that shifts to 0.

Sounds good, will send a v2 with this change.

Thanks,
Kuba
