Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4AB3515EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967663; cv=none; b=mfQleCevekXjxHjjKjhnlocv2IlOB8a1fKF8DzLS8nkWEdWBRmVCqChklrny2MCU/CYkpvktCffyQkMUQLv/9VQk9Cq05OrSs6+ZWylxdpgVLt7oDpUewuk9YpDnjKsXeFsDCynJb9r5TpUyH/FnOfABT32TfpStvK7w4lwNCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967663; c=relaxed/simple;
	bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHTaoumjX0Fn+UiVvs20BDw9JzvaeNGLlhLqB+arIDQjTp0I+aE8Mi0mcphe587oojj7b8lLlv5NX3rZSsxtfUinxplcKSESs7Qd5gwGkzi2vF1SVUohzJW90TdqfN1sPj9CTxiphJm1W2fm7+hDeYY7Sv9XoAKwHJ/3C5+URIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tK1btjsP; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tK1btjsP"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2d91a931f66so16493445ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967661; x=1790572461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
        b=tK1btjsPaknSm4yD9RMpuxh5vXle+iwySJPp2/N+bSwg9iiQEL+yYffEK2zG0WPq+k
         fQLhVbYWu1ATbEm9/C4on8D/sMhL0Yg/R27O/yralTJNX7y8MqMn9ERxmAicHpHme4M+
         1wS9PIf2/Wjb8kADSHBRUoDibdjY7ScNZM3MthUD93gCQRpUiMECSKiclx0rnQBagyiH
         cBmNkT9xrrc3KwLiyvZnkmvKZexG4xegLcKDWIhlRPDJzFjzdu87+AxSzRQZ+xlmfqZp
         wX2pnfezJvxjOs3bxfdTynpLk2C6wk8s1h9tSgGYPEN29bmRcesZKr59G0oCmMLi+15i
         R5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967661; x=1790572461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
        b=u9WdZWd8tlGE9ckQcD24JVajdQa2OKRMLkhrrAJrzvNWDJZvGlXm0iujV15/CbK0DX
         KY8K+QyGs3S1dskLxvVqHpFx9zOUjmjSg5wIEDmMSucuJ6qfXyEAiiAuo6WomyrDaAMs
         R+QJ5iO1wVkTXsN7IEHgETE3xgaSxa3OjXDwB6U65x5jPua7pBCpE76T3NLCDJspBjcE
         QENAEmPqvQ3CVEadaNMrcI0+EXEvldZ24GJ069fxAGCVWbp5/8eyXWhOYDpwRXCSXDnh
         tzl2e80qXvhHhGShasaQlEEbEGxksRVVQ2Mc7jsC9+FW9we6+xX+9ymwdV2HotpQYixr
         7unA==
X-Forwarded-Encrypted: i=1; AKwUvBwDna+ynZthoVBeDquBIxDAw5sY2AGvnoWA/aPI8b/xK3HdNQumG+zClNKsAGdp9R50Z39NTxYnDlwCPJA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMm0MwHMFzLtd0JPv58uIzlSJD2VZkguz2W71yTyxqqU2tS9ES
	JlOs70QDn8ptbkG7Iz8KPXN2JFK1oga9wf6QE16bw+oeA7jBcuZk2F18
X-Gm-Gg: AYBFou0eCzivzLqsxxvXueCM9UGPwhnGd3JVLDNEZ1QL2kLtnOzYewCA7orcil+JkFN
	GiQaYEJVTVOV2XeDu8+WqvdX14xCsUOp3OftmJvdw5r9atKarNZaqivQhbIPSrbre/2TPqNt/UQ
	ofQpbgE2aYCND1lM5SEhkCi5tMatGxblOxi4ElwEcefQIktXdGqJ/HngqK3/cfkbYq4a/9UYxOl
	VbcF5UBb1xJUFpMf1H2i7Sy86FR5OdN+L1wMCgQMmVEb4faiOSDz77MHHvIK2oLtqiwOEdpfiE8
	vH+uPU1x9+JdwrCsDOAlb2fqJuVe7vs3o01Z1KzWsB1jzNPyGoiEuv8hcBv+DN011lrPBk3Upgm
	4AR+yXoZyYPAuOnV6v2JGPRTuvZUtelSmnv9shPm13KQKvV+azfi2hoi6cDWbvWwb1cC9uJkcxQ
	2u5Ti0txW4G7RVESit9zJCmDIRUkUrPoivBuq4IBSTUCgyvlvvv56IvR8nsznlSF8ZWaLVnqSJ
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:4b77 with SMTP id 98e67ed59e1d1-39e6c6a5492mr9009542a91.65.1789967661087;
        Sun, 20 Sep 2026 22:14:21 -0700 (PDT)
Received: from adi.. ([122.171.22.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33142a37sm17698440eec.15.2026.09.20.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:14:20 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 05:13:34 +0000
Message-ID: <20260921051334.1143-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092053-rentable-affair-bfce@gregkh>
References: <2026092053-rentable-affair-bfce@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

I ran smatch over drivers/staging and it flagged this
function - the check here allows ie_length up to ~976 bytes (1000
minus the 24-byte header), but network.ies[] is only MAX_IE_SZ (768)
bytes, so the memcpy() a few lines down can read past the end of
that array.

I went and checked every place that sets ie_length before it reaches
here - collect_bss_info() in rtw_mlme_ext.c, and the two
H2C_PARAMETERS_ERROR checks nearby - and all of them already clamp it
to MAX_IE_SZ. So this isn't reachable through any current caller, it
was just the local check not matching the actual buffer size. Wanted
to fix it directly rather than rely on every caller continuing to
enforce that cap.

For testing I have build-tested with make M=drivers/staging/rtl8723bs, clean
checkpatch. I don't have the actual hardware to test at runtime, and
since this only tightens a bound that's already unreachable in
practice, there's no behavior change for any existing valid input.

Thanks,
Adi
