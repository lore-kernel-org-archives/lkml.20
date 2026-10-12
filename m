Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609733FE33
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779003; cv=none; b=oI6AdeEptenOyeQECzufNfx9YEKMd3ZO/jQcgPsuGlH4WHtF/utnReoQcbz8P1M+kzPdrZ4q86i1kV77K0tN8+chL7y22z+IpHE45Sh+OBaF+K30pLQ06VtevwLp42r/NtVHUCDw3IEhHnFBxvzdqllmugmbPDnTlQ6CSOdwEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779003; c=relaxed/simple;
	bh=lPCfJay/62/aqSCtdYw6Mj/fly70GzFauxJDKqH6fbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ix2cyPvBf7oWboDXhMJvf8Wl1Wi4HAABA4OXGQPZd7QOQ/SCVrXQJxYW/lzxwMPvo/WuX/qvsTqImgwVBxXiSWG76KhztEJS7j4xLKc7VZX1kUTjrJMX8mkV2rlCnI5PGpwByKi188Idl4un0+i0+SBpxUWEAeRHIHMtH4th3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=BlxmtSrm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="BlxmtSrm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccca948203aso421986a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791779001; x=1792383801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPCfJay/62/aqSCtdYw6Mj/fly70GzFauxJDKqH6fbU=;
        b=BlxmtSrmH7cn1/S+LP0TEfR92I7gedMMyGH5KYuJfDihYIG4DIM1JTz2TE+pvR3eRV
         aL8uV0cK69E39t9GjBk/0YGqq0BwdokG0eySP1zKUY3XK8HQdp/dIJBYbVmZFQ+gmKWS
         ZyJ1Ubb6c8M81U/IZc4BodZxUutiQf0STW+2rTumHXrVOp8ZA+jT07muz7yQGd83uoXw
         lafwT1tZFZo9/MXJd9gHoeSvVNS0V+IR9P2inH9y25NTP/AMQMGnVxXYCroobO75rgBI
         zvEa3RGEJZ4ld/ChBOC+n705NdUTui6StuAgbLCS6WuBTB1uTk7YCwy1fsj9NKApxihY
         tE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779001; x=1792383801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPCfJay/62/aqSCtdYw6Mj/fly70GzFauxJDKqH6fbU=;
        b=vOXuUnMOx5wkm1wZ/uXmYTwtpUa9mSDC+ox7PRfe9pxofDCCggib851pf603srrVRA
         B+3Mg9QHXFRPbiMkrlMboQvFx0P4o1QNsatogiusnPabgZRGcmT/kVOYdMEshjyNG5Jx
         oPAo1EikPey52eDdMTTjEVplimjH1WKba49fAQAi5OzH+bFsUCQU3r/36xIeK+xbRjmh
         N08z+bNY5pM68obrWItCW/0AJN0V/bGlbCbdy6TkS7A/+iRg6rv1xD+iqFkKL4KpYiWI
         GodjrwmsOnSwXdBi2bgx/Chx6UkbKaR7vUjiTMARTpKk9qpg2ItBhGordhoExkfAMTuW
         2ENw==
X-Forwarded-Encrypted: i=1; AKwUvBzhRWvRaZfqdhEElJ/5CIZNCwX6O49UWamUuvweG+dgpg3YWzLyCCsXlUhUcQEBxArHdBiTQZk6ohG6h+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm4YzZFiTZxm9rvKqauGCK/UG66urN+h8Zr+TDyq87J4JrKIMd
	2Xgsmd+sX1R9VOmTeamDTdVF1NTvX+mfveMWSMQlM7EKRGJnh5PDFkzYrkWQ+crlb5g=
X-Gm-Gg: AYBFou1B6/+sQebIBCywGc4LDr+44wBZWtOwe1zL8wxHvIDpajZXdlh1hJg3e9uN27h
	WuqTLm7wtD0o+gtmZb7rvEpYE6zLoeUgv+9n2WPqFZ4ypUsEFAVFxn7FFVf+sKWSEG3+f55U2Sr
	Ae68f5iaLHg584LsQdJW4tZ03E+qsqW1WVs9d0TvXV7Czj0AEAS/YBLm1mGA5oaVwpt+CYW/0nZ
	ARGXGUEZMlrkvGGpsvsQQZWn1kiyRQNq3G/MjGJAvQgR78EVqDnW1Yl5HxH3y/IaPeyoPyEWTgZ
	y5Uaev2Jz3hAeXAon7cXIZALP5XKs2H4cq+gzoKbBz4dY0uyiywsLAGiWu+kHDFc/APKj8of7e4
	r57qLIRZD1+au3r78tpv0FbWaSXRclzRWHhU77kLHzECh5XNMCwB/IrW6CJUeBE/lbVVQFe70TX
	NCZqRzXOrRqqg/e2iYe3l1IpvFjUhKv7BAYt24t5zBnEN88YkyvodNzX0H4cd7yiEe17uXWc9EU
	nkCMUbUZbWBjV/m
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab3a94ffa7mr6274668a91.16.1791779000936;
        Sun, 11 Oct 2026 21:23:20 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm13989543a91.4.2026.10.11.21.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:23:20 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH net v2 0/2] eth: fbnic: validate the Rx completion path
Date: Mon, 12 Oct 2026 13:23:10 +0900
Message-ID: <20261012042310.2167618-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791659860.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791659860.git.yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pw-bot: cr

Superseded by v3: https://lore.kernel.org/netdev/cover.1791775409.git.yhlee@isslab.korea.ac.kr/
