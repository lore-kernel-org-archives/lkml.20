Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583806;
	b=nGuYZbaV2ytc6vbWTubXFWkOde2BgG5yAftusHbVpGPXthZ12J3YcSBNI/JI7bLCiJgK
	 nPHuVeDHRWk4aAEdWAVep7QSPqTsy+RmZCRPT0JtuotC2uSHNDtPw6XHBfpStrxIkjTTM
	 jIJviHUSOmbNC2eH6PBAxwz2XbmDG9RVXGpWjRG1ghyUdufKukyfQ2dXGGXSpY459WVTm
	 4vcDzsg5MrcfFQNoRgV7ntf06xo94jxnGtxh5uXbE6wNERdiWRv8TqFGJrhPOHBFfrIrs
	 wbj0UTu03HdU4n+ePEovhXtjvSBUtNUfS+C8DLjw864t+jQufSiJ8LPCBfak2pRVwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=25HQcasjSxqCf6dqX+3PCt7YydgfJ0RpprQQR2JRC/4=;
	b=mHMfp+pPX6uxC/XTbTFzUbXwKm2WSz4EVWttXm1nV4iG1wIcF3r2ygpQGvSSKEK8OC9+
	 ORfJkkF9BqE55AsW+wYwq1i1LA//kT24pqfPWx94VsbzK/cM0O52+z3O581v51p+LhRcu
	 eG8LSuP4wesvh/lDx/TsaDfdOV5owCMH51+eZx7+/S6iRqz1VFGsL2c7SLYUSxCNeSELM
	 GaeSURtppNlKr2VcaR1eejjEYWu/v54+K0HvYPUtmzTJNlQ5o8Hjq8rpJJRUTTp5U/d51
	 K7UIGZqKiBx9cbMZXwvGdVJU6HEGOn++bnj/Vhvi02ElO2wHvzYOoU0OwCbHZYKjYGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXCRWMs0;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF455606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF455606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXCRWMs0
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-157fe9d771bso800720c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792583805; x=1793188605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25HQcasjSxqCf6dqX+3PCt7YydgfJ0RpprQQR2JRC/4=;
        b=pXCRWMs0l3QRpaBSy14qZql0Lx3jKYNNyZ1lfjPRWlIng2vmo024sDDXSZ+ux57lN2
         Wf+mMi+agWX7TfzNVhoXmnifhbWVxU6vQHMMbJg8FoIGVfaupMgJBAafWXrQDcz4NseG
         vQ9GKUWJ8dN5+s63g0JdWb1lZzdDEti++QAkjOPPv/wv60Ajf+llkwXRZTPq2iD+bEId
         CxlhH4h/KOi2BUdwra4TKTlejg29OQfYKA4Bi7aPcLL2CGHtlYRF7NxnMy2vmAp9y6QQ
         ivc31XiWscm1hjaCscVFQU3ksqNQHyKyZeW3EqJiAnl+bh3F9WXtohJUBbuzXZKdhaX1
         qTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583805; x=1793188605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25HQcasjSxqCf6dqX+3PCt7YydgfJ0RpprQQR2JRC/4=;
        b=HnnS8DRcJiVeqBvHoByGLSc0sqWxosRXn5Z2Fz6EDsahA1Ztrh9pKs7wokoWJMtQz9
         AkZ3uvLfamNNSVS3yYoWKpsc3dZXg7rXh9Tx7JQgt66HPs55GtHy7rlfMACZFuR0uxlh
         VTnuMMbrkwvHN1ocB4FKVKvvZ3EdaBW30HKdkBrDWmXQ38hNnj753vbwDUeh0Tapv+RK
         gbD8G3iDrGURLmtg0UPE6SNPbQTJciE9M9PFwCzEKgTYkmIsjpugKlVh1hVNiF5Pp1DO
         rNN++VIFjwhcuBVX81c1xT/cvwWM/vNh8Z3D7JPQLlpLXBZDziszh8gL7+E6mgnTqZuM
         7YBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVgpWtfZMjXSX77bS9WSDEGuoCYeq2Tm+en3zWNiShOHdVJ8MQ+Lvr1F40+4b4PSIPPNsYuE3BOOGRRMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVNi8LtV7cn6eWFCIlWTzrE8+LpZUfTSVBXD1yMaiaXvGQv+w1
	YKjO41UrhlZwMVxg+gcPw6dwmyFurVwhGfzOwUmxR2vOZCvnK013rD+v2PFGzKGb
X-Gm-Gg: AYBFou2AVq4yyK3fYShY/RhVVSn9Qtf6M6cRldLoZbC7igdB7MvoPfM7xk9N8ySH/w7
	14BA6dUkj7obwT9vjFuE1icPgNEfg0C/tN9lUQk6qGzavGHFcZPzWmIpltI2++q/PWtfTi4zcRv
	2hWbv3KfgDPWPU1t4RWZiHo34ocHf4bkvfwoP1t9iFJDVAGhuonRhqJ1Xkj3s4Yc9jxrpyP9pbU
	NUc1rmFBQ7TSmMveRux9+/Jug8/KBtMY4yMvdkemE/erZZMVav49qtBukZhomiLtY9f20iFcLUi
	STG9Xz1FMkH1gBIF5XOJG+pJeD+mbEoxfEQPmKtMxvo0wHkpiIOAHOkiejtZT3ReTJYeta5zta4
	YmppHPlsLFjGdK8Q+e10m20+v1AR0hy6j4UQSA0sI9aRTiBtWaJ2d3SEsXJt21qkfwxTpMgjrCw
	tdT6DH6f0p5u2+UwMHmZb44hMhtymC+tvI6Ru4kJ5Kcd8vryQaGGyMDBCbNnzzucxEUt4OdGKgW
	1HAisN4kmobbk1VgTp6T02WTJGAYiflQdiXw6fbl3wVSMaH
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr3350163c88.7.1792583804543;
        Wed, 21 Oct 2026 04:56:44 -0700 (PDT)
Received: from dev ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm6055020c88.22.2026.10.21.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:56:43 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Goller <g.goller@proxmox.com>
Subject: Re: [PATCH net-next v3 1/2] seg6: skip the route refcount in seg6local IPv6 lookups
Date: Wed, 21 Oct 2026 20:56:40 +0900
Message-ID: <20261020031413.seg6-lookup-noref-v3-reply-5f2735b7@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020010429.eeffd6f140ec6157609c310a@uniroma2.it>
References: <20261015-seg6-lookup-noref-v3-0-6d51a60a67d3@gmail.com> <20261015-seg6-lookup-noref-v3-1-6d51a60a67d3@gmail.com> <20261020010429.eeffd6f140ec6157609c310a@uniroma2.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 01:04:29 +0200
Andrea Mayer <andrea.mayer@uniroma2.it> wrote:

> After a noref lookup, the "out:" branch still takes a reference on
> ip6_blk_hole_entry and then clears RT6_LOOKUP_F_DST_NOREF.
>
> This branch can be taken at steady state.

Agreed.  With a local next segment, every End packet goes through the
"out:" branch and takes a reference on a shared entry, which is what
the series removes for ip6_null_entry.  On v3, 20000 such packets made
20000 more dst_release() calls than with your suggestion applied.

> For a blackhole rule, __fib6_rule_action() picks ip6_blk_hole_entry and
> takes no reference on it when the lookup has RT6_LOOKUP_F_DST_NOREF. The
> "out:" branch could do the same, for example:
>
> 	if (!dst) {
> 		dst = &net->ipv6.ip6_blk_hole_entry->dst;
> 		if (!(flags & RT6_LOOKUP_F_DST_NOREF))
> 			dst_hold(dst);
> 	}

v4 will do that, and will set RT6_LOOKUP_F_DST_NOREF before
fib6_get_table() in the table branch, so that a missing table takes no
reference either.  The oif branch will keep the flag clear.

> Nit: seg6_lookup_any_nexthop_noref() and seg6_lookup_nexthop_noref() can
> attach the dst without a reference. They rely on being called under RCU. A
> one line comment about this, like the one ip6_route_input() has, could help
> the next reader.

v4 will add one to both helpers.
