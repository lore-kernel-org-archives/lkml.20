Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1893D7D6C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329577; cv=none; b=iCtgPztl8UHLkGu93Y2R4mfvoRMO7k7TkGu84c5/7Z5q/c6vEcC45osXV/k7SUdiPVXAg/FJCyczQ1MoHL7DT8vruywEq5lCTIfRdl0Rsj45jWvvzpQmFLzTnLK+0F3+MaI1XH3nHMC2nFZWbOtEW0QVhGEphgVGGC31D8MV0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329577; c=relaxed/simple;
	bh=8uBrJgFPuxy+BLTmgpJjVgcQvgOGHRiBjGy3ylfY+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3vN3fSmG2Sj6x/ypKqqcGWzU/5V0inFqjVsEEan+STxWsrK1t/N0VBhJFeBkXLC3oDb44bJOweRzt1Vv+r1PDWvo8kTjV77N1LhFFOCSJqaEE5zFHvMrMW7hmrv2BX+rg4Rk4whUtns/k47KG5QUfozz/+oPrQA/gUD1xcbrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=t0dy4z5X; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="t0dy4z5X"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso88322266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792329574; x=1792934374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=t0dy4z5XpfgynbquqXLd8aUy9j+JPfX/vd9PFgPmGBYCE4Gm2Wp8j5QkjBQbj7VF0a
         dWrrTwd+73K7uPdBloq/XTh3WtOkcHMCX2TP8J8FM+QUHrFMeUDvW/647Y4zCbNxgh5N
         2z7l49dN8DM/aYU1Q3r4vpqiTJUPmm1Q+ayqgmXxJOoHmGSYxm0E2F5aTUYvN/o5xNj7
         r3cCanaN0ABR2Wyuc7bnTzYggdD7X91u6G7MUqUOa/vPsPU3toirVMd3DKhhM9KKF6Zd
         OGjlcul0bQUo1TtH9UdvxhZN6q4h5ulH1/u7MWUZstVJgj5cSOIufT1MKkrYBH6KAJps
         Kwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329574; x=1792934374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=lw8zPwp8SoJfEIF225R9y+JElK4hoCaWdtWyygPaZciqq5ujm14n0aNt9j+bken5dS
         436wfNEGC4vZhFACTnnxeAekvHHf00cRqn8yByISRP41Xbp0QylMxBFo1rHZfHPUJZid
         z3rSqPWJT4yyl/G36jmPYROAJEIDjDJq07vJCTLjJY619yyWOwehEzP7CRB9o1YNN4DX
         cBc5CkI15chU4rxatZBW00Ny2Xp0FmSrdec2XXQgtxcIPs4RUsVbzf1KUDzaJ2GZn1mv
         k8DNPITwCI4DyVJLFiqqVmeKHfRrNZtj9vKFyzBPnaKGtIa+GXq/GqzUmPDi139/jqE5
         /ayA==
X-Forwarded-Encrypted: i=1; AKwUvBzd5+tQXpXOP9xwuku3Pnvd8yJvhgnOkAXM8mUBrlZiUR9xNyCkqPFG5GxOqJYTI3cCiiI6xDPR6cPgebg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOsr/Ijx33ko626iCSa6J/ZNKRilP5ahey05RTbv1YbDBiTTnI
	NHXyt5tKtsSa0NiMl7aroyNUKMflfbDxteSlZhuJAp4mVYgJMq6vVPdz3e25sgufcQ==
X-Gm-Gg: AYBFou2vxazjci2dMMS1LrfUO7W7OroH7saOtBb+exViCI/RyCVxo34nCnv0cWsC+Mo
	6SoGL34LG8qn9Bz1LivE1sQKbBl5+x0e7vLOpqRc8MaJN/2WlpjJ1UEalm+flcLLNRMJmkh2NzB
	xTrYfDse4yY/UyX9PqaKBLbv0WWhDp3TrRzk2kkdi71s1OO0RPzMJ+7UKUQOJrY3HG8OGyJoI9X
	WzddLgK4rMPTmZmvo/ywPzg3nfo1DZfHn7qFxWdK5je7Jx+2X8YyMdNVQKL/2pA+VbF4QhvdIEn
	whJ6WGNxHgwBtwF2Xt842sXk9qcWTYTMzd9oAy6tHQkOwq7kGy+Ruc9Hb1TYIey4yVmrJ6Hb66h
	ZPSnOCqAwptppdWLNSW2wZE1/8/BFhYXVFju1nF47GD0ol13qxarnffbW5hnETTEtQOCvy6CCx7
	aRhHmo5kuLfYiHGlmbIYoTD2ToR8n5BfJTDEWf2aa9F8StFWwBNRXV8XG5LYcKtjg6qi2fB8C7m
	0CB2B+/PeVBnZadSYjm+oWyoAYHV9Evb+Xb1XweK/3VAUp86AEWbo/p7959m6hjJD0e7E6pOLsV
	ZJtXqYxzb6Shg929lKK+6Nd1LvPJabeY/22oLCFGDQdi6QGtN7f0/TAG3HQsAuOBYljJONVdu0P
	g3QoucLWZAHEvlEuJ4Kx3qYThhrsaSUaDURzP5HtcmM18KJToBK9qPk+uQ8zBQoz1CB48Il5Ifw
	bW6zAJf9unu8ZLLXjVpvU=
X-Received: by 2002:a17:907:d643:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c419f80267amr348395066b.38.1792329574061;
        Sun, 18 Oct 2026 06:19:34 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm264093166b.27.2026.10.18.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:19:33 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
	jjohnson@kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Zhi-Jun You <hujy652@gmail.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Sun, 18 Oct 2026 15:19:30 +0200
Message-ID: <20261018131930.1116724-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017074012.35602-1-jtornosm@redhat.com>
References: <20261017074012.35602-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi José Ignacio,

On Sat, Oct 17, 2026 at 09:40 AM Jose Ignacio Tornos Martinez wrote:
> For ath11k, my series is smaller (4 patches, 7 review cycles) and has
> no external dependencies, so it may be simpler to land first. Julius
> already offered to rebase onto it in his cover letter [1] and move the
> ring check into his scheduling round.

Agreed.

One thing on patch 3, from reading the code:

> +		if (num_free == 0) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}

When this breaks, the frames stay in the txq and nothing restarts it
until mac80211 queues the next frame for that txq. A sender waiting for
ACKs then stalls until its retransmit timeout. With AQL I measured this
in v4: one download in three stalled, max RTT 347 ms. A restart from
ath11k_dp_tx_completion_handler() fixes it.

For patches 1-3:

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # IPQ8074 WLAN.HK.2.9.0.1-02146

Julius
