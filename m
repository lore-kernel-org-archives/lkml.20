Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFCF44AB77
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516564; cv=none; b=SZKMVVIsmpmT0LrGJ+njkX7KzYxxuFhFQ2Gur4lUh5q7kp0eo3kzSkh5JChegwiRNCViCTLDRiVCk5TDd90tLjKHeytOEtfMpv44b2pH5t4bElHiqyu9/+RWl0r11XIJwp5Yw2Zd4CYj9Hn9JqhcsYlMjo/t/8T/Plv4MHiHhNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516564; c=relaxed/simple;
	bh=ZPTK+D9yB4z8gSsX97iV+kjGxTz2CssU6OP6vc4egpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z//t76vtlTfsXCCtvPDx0R5cQOiWuRlqYUo59nu10qwIJRILiqmgjPt+TWaSOrrM6ddwF1IiaCKdD/8g7HpQjFXFkq6Wt6OdY1HpBN/Bhc26tnBheaQXcrVv+XN5Bj5KrBHTexmh+5Vp1NF0+ZX5DciPvCIrPzxN+14byO6lioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGUqMFl5; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGUqMFl5"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so955486a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788516559; x=1789121359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkDl0Y4zNUnFCr0BpcsL/xKlNTA0whYo8hcoWC1r1Ck=;
        b=XGUqMFl5hBteE0sUv0SDEcPgRiKQTuvZMuMht7c6lbAy+oHbNHnV2xPd33AbG9NYe2
         AsSACcpB8dtmZVj50IBi87V0qzAi+6R7fE7AETlqRxoABP4o4xUTycuUZe+OAaxYQbVY
         bnvlIFe6JhmNZfp7ayoFAndP+S0tvf5mq489aYuvt3wNuqHBwkd/07dRUNzrvMzNv6oe
         Ki4SE2RJ22TAduugKnQW25Y6iPWjcyp+6xgPFqL1kvPikfpp0e26KKP4luxGiqJjM26m
         i9yT0DlKRB7LNZWCKyxKJZBMEpBBSr9xDmDRdn7AhdMNJWAW5bKOYmgwDnjs1IrQF/gz
         gbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516559; x=1789121359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zkDl0Y4zNUnFCr0BpcsL/xKlNTA0whYo8hcoWC1r1Ck=;
        b=NmgNNbqd1V87C8g3mCD42kc7VMQYK+FFhgf+MVVb5hoNWlLPeZlWzXdf7KsTWeLJlO
         Up4ZqUa3S8HD7w7+NS0i9JPTh936ehrUZqYlxF10U+R21i1ftJM70POaFhKEK7oU1J/S
         QS2EjaHr8Zmiq/9Lf1DPz+YPgStMGo0xbFue35tnWocboVXGAHkj+r16rNY//R14A+8i
         rHpki39hN/zCmDZkli8VHJRkNT57fQFPWWbIOEQnbeWg04I28uO65HL/AoNeU6YngNT4
         gPyUnuhdN69kOu9OVxCeOXQG6lfNQmotoEJNT3iZIhL9zzbepl3MeRhUNvPbODV1BPCs
         kaXQ==
X-Forwarded-Encrypted: i=1; AKwUvByrrAsF2HfN013xuz/muysU2DQ9JkXa37MoFL/+8AVbi4uneANbUOnWVA3HQpMPElqiXEVuc101fpEARTA=@vger.kernel.org
X-Gm-Message-State: AFuF++npjeLY3mMN6ZnPO7fJEt1GTbpLRI+malMWadTjS4y8sKEYACop
	qgCH3FifpmMC1c+vDIP2Kd+ji3WWc6Ayx1itI/F1/s3dOVgjDPjG9kuX
X-Gm-Gg: AYBFou0noap139UWkfZEHZEp4L3/VdjTWG0PtV07PrtdNks33UnWBqx75viGuL2Fs43
	oDEtNy1m46yLD+53ksjsU7s9GrsklbKHu7uvrdGsXOk5i9DQ7Nk3XikJVu+TpigNJ8rStgN/5/g
	63bqF2X65X62MXKPq6ZAJqZMGiaQwVZatRPBp/phIA9VCC/i6WfBQzRHghnxOGR5UDnJ8P4lzxh
	Re3DEvcs7iwqtDGNCx8PuXU/oZzcfMHnlPCyEsv5QRZ+8lmKSBzNc2k4m95uwhi0Xt6W1Npb11J
	qBNYL5vhcM9HlkERyecIOIWCuhxDIt13OYKgMJ8e5I2hQlvWDJAIxQZdU9aMj+UHG9hFPecL4W2
	7niy/wOO1GA4sULSfWgn9uJlweELFhwWtydfuJWq0JczTgeYAZEZa4fiOpx7Dzy2JIzs/dBCVkb
	cND/hzekiMgogaUMA9UGUWbsocYoxr+c8s9eHBcnEj4LVEBYS5+9LvU3PYyI3Ga0e256mcS+/h7
	uLlDpp6u9WYd/Ax0APg7gh6RS88
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr9006849a91.0.1788516559196;
        Fri, 04 Sep 2026 03:09:19 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm3692904a91.13.2026.09.04.03.09.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 03:09:18 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v2 00/13] mm/swap: introduce per-priority allocation queues
Date: Fri,  4 Sep 2026 18:08:49 +0800
Message-ID: <20260904100900.21517-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <appvhlPleahTRklV@yjaykim-PowerEdge-T330>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com> <appvhlPleahTRklV@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Sep 2026 16:13:10 +0900 Youngjun Park <youngjun.park@lge.com> wrote:

> Since tiers come up further down, I'd like to raise a point about the
> patch subject line too. As Kairui mentioned in RFC v1 that we would
> stay aligned with tiers, would it make sense to frame this RFC as a
> per-tier allocation policy (or something along those lines)? Kairui,
> what's your opinion?

Thanks for the thoughtful feedback and for taking an initial pass over
the series.

I agree that this queue could naturally become an in-tier allocation
policy. For this RFC, I would prefer to keep it separate and scoped to
the existing priority semantics while the tier and virtual-swap
directions are still being settled. We can revisit the subject and
naming once that boundary is clearer.

I will also sync with Kairui when he has time. He has several things in
flight, but his view on the ownership and framing would be valuable.

> Devices assigned to the same tier already share the same priority, so
> I don't think the allocation policy needs more than one option for
> that case (I can't think of a use case that would need it).
>
> 1. For legacy swap with no tier configured, define it as a single
>    priority treated as one tier.
> 2. When priorities match, allocation naturally falls to a single
>    policy (not a queue). the concrete policy here is this
>    queue-based scheme.
> 3. When tiers are enabled, devices previously assigned under legacy
>    swap are reassigned to tiers at runtime.
>    (This means different swap device on same tier handled like same priority device)

These are useful design points. I would like to study the concrete v11
before deciding between runtime, boot-time, or compile-time tier
assignment. It seems safer not to bind this queue RFC to a permanent
tier interface while those semantics and the virtual-swap backend model
are still under discussion.

> I think this feature will also be needed on the virtualized swap side,
> which makes me wonder whether this patch should go back into the swap
> tier series instead. Kairui, Lian, what do you think? (Or separately?)
>
> I've also been thinking about how to move the tier series forward
> since v10. I'll prepare v11 shortly.

I agree that the mechanism should be useful on the virtualized-swap side
too. Once you post v11, I will study and review it, and I am happy to
work with you on whether the queue should be rebased onto the tier
infrastructure or remain a separate policy layer.

> This is the direction I was hoping for. (TBD)
>
> Within a tier. /sys/kernel/mm/swap/tiers/<tier name>/<policy name>
>
> - Across tiers: allocation follows priority based on speed
>   differences.
> - Within a tier: a selectable policy applies.
>   - The default policy is this series' scheme.
>   - Priority-based distribution should also be possible within a
>     tier.
>   - If xswap is introduced, its allocation should be selectable based
>     on memcg.
>   - Other custom allocation methods (round-robin, etc.).

The split between cross-tier selection and an in-tier allocation policy
makes sense to me. Keeping the current queue as an independent mechanism
for now should let us evaluate it as the possible default policy without
committing the tier ABI prematurely.

> No regression is great news. the plist refactor is valuable on its
> own merits.
>
> That said, could you also share data on other angles, such as lock-
> contention benefits, or advantages in other use-case scenarios? (I'll
> also think about what would be worth testing here.)

Yes. I will add direct lock-contention measurements, the one-device
case, and higher-priority rings containing full devices. Let's keep
sharing results and test ideas as the two series evolve.

> I've done an initial pass and given my review. I'll keep providing
> feedback as I go through the patch contents. :)

Thank you. The v2 code delta from v1 is intentionally focused. If you
find any problem in the individual patches, please let me know and I
will iterate on it with you. I also plan to spend time this weekend
studying your recent v3 swap work, and I look forward to reviewing v11.

Thanks,
Lian
