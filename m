Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960662;
	b=OCT/c+rcXnf69T1g+flTxfUZg1NiD9j268Jom2ockRGkgR06n7Cy2hwZJB5zf2Uf7DVK
	 tU2tOgBvvUalF6/azlX76pGOsEJRjK/H84Fy1jVM5shd/CFWseM45ctsCcJ3ipZ3NeqSb
	 vhDWI5CAxBN6vBiUMBOgprBiZ18zw9kqLv4hbi+zvmaRl8pJIAi3wKl45CmheRY8/Rbmk
	 sWda5GAFBS21WMU4MoYiCfXBSQgpKkteGOpLvwZmO2V/I/9zuaSHUgARLObyMD0f3bP1W
	 4rnatysun2D1W/uvb5K1mlNNUu5EMULAO2RwxewDAgkj1I1G1Cmy41b30ORvly2Cj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hCvngCCmtMWznCnZmouYhzYU8/Rvvngg4bkbOzBf59g=;
	b=K6GQK5ZrG7MvOE6+XkS5dEb9UghXp5v8BNYTDT/BE/fpoGHD4OC464E9sH4l4subvO2d
	 sVGfq4WDLhalYUgiexezosyMxDO4kt9BIiwkH3BI7cLSaumrIZCUghlLryrjC1U8/H0zp
	 oS2hEZRWXqcx02HOYCaRPKHWjDPpai2DVPMpPaKha/y/5qTyObf/bmM2K8MdMNVi6QXqy
	 y5zX1overaHHDOUyuanpanxjJoEff5Ww4V55+FDzim2v1bFAwdCoYlCw507nn27GKisz4
	 SVmLXVZDONR1hcVnVrYhZESekyuv+2+XIM45J7ROpwTrDqztjv9x9xj3lItbB7S2spQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O96FlOVu;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6D606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB6D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O96FlOVu
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c498e2d623bso27596566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960661; x=1793565461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hCvngCCmtMWznCnZmouYhzYU8/Rvvngg4bkbOzBf59g=;
        b=O96FlOVu2AU024F7VM2xVWto+U5/tsLlBuf3bCFhPmRAIuAwq1O+6MMViL+L2q6uWx
         s5vKR732zQ1cYkPLLta3HlOwGu3ednBTGqKoTUnqYYAnawGM3AjGdF4NSXi1OhX+5qMg
         gLEFmlNaidIVnGk8U6D2pIJp0UDItis2XDfpJ6Y4u96MwinFsKtqQgAe+IttrH9+EWjJ
         FH5EeasLZ6FwFQJk80ry92h6j648S9PB0pJpbXxt4U5eRwvM38eEdRuPP9VN2TszgQZb
         bhJtzOtSmwWBZQ5Tajs/zuRpWE/uu7rX/20Mn6PknOSXp4XcYRhEE+aiAbMrCgNECwZc
         MMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960661; x=1793565461;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCvngCCmtMWznCnZmouYhzYU8/Rvvngg4bkbOzBf59g=;
        b=0fOm1V03lEa7lEpa0b2yd9RRmLuF6zbpYnocn31RvEQcKD2rLX+4ZEC15a0wiwfCbB
         WCFRjsxTdYXGI+1lB7KGAvJjWBHfzGkTMnwXFU0AtYNLf1dIy+rSBAj826Tdo6dyOG8U
         s1YE5Vn2m8ZtJJdFwnBiM9STFqZ9RtV4ijNbHXFlE96uipywdLyPMLNdj8V9Z6xeUnSy
         o628c1h0PXmy7+x5pjJgEIHzFp1fUml9jpCRyXKiASWbpt0HWbXq6OfDzmqwYqmcWFL5
         a914DTlvU3rmxwy8P9nCs2blbww5Lm3mbmUrQcabJFz0YjZakW/v8+RS/yHnv8epUUBw
         FqMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfe/zmn/7z3/ZtX4jrtJxO9J/+7HawNUAYR+5k4oMse1zOvqZidPbwXlrAYR5w26NQQWzcqRDKJBUM9iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA/cRy/rgHEX3mNsMR243Pui3gUAPI1xrf/FcEHiI1CNX6pYqs
	VruhxQbrZ55Fge52ZFJCcg2zNO/m6QPBl++wdVbCc6hjSO6YKB9QhPf7
X-Gm-Gg: AYBFou0KWMGUfFV3C6IE5CA5nYAebHolgf52d4hzPkIDtSJYeAokZWILtG1wvixp4e3
	A43lWaLTiTuaKDHQ0dLXr15cpJ8FMj88c3NhcQMG0WqRiZTKdAlVBzy3cguzYUqIcVNPTXYHs7m
	qYHUkpfV/8KU056VP3hLwssTH4DlCsAyoWCY8XIjQ7+vizBVcNtCtFQ3Cu7GeGuFwiPTOwixf/N
	/maszWhvc14PYWNIiACiN0SCZE4NjQN08O8IGNefWSAPnUwsrA5HrsFE2A2kUiPW0k0DrnPKixb
	PaDG5orsyKxecgd9kg8vA+H0ikrRCob+j0I7Cp83QcB04MV69b4XFEdU3s7tP86sDnusrq8rjGh
	gDjdtP2DIn+/seMPxpha6RMv9mPlJaaMXjShcBajNjQBcvGM6hTTYnwVmkr2msNxQdJ9tgchpVG
	epezjDxd3lh8MEM6NohUgn375nwmso9ldZbMWFGMcqIkEi/2crSi3ln4GRqNRutEi5WlVfwhcaQ
	JjZaUwETGPr2FAZ2fH1Y7iwssqLzxj3SgJQEZy6sb/7R/xZpzqJPiMJgod+6zicl0XP5CH3+5g8
	T3Oxbgvyw/6otBLv65ob3yz+RiR+SUWZyT55I/3zjy05p/+gm+MszfL9yPc4aAYfvENFC7tQx1Q
	qTUEKo8FWRir1KRxK3WiKjluOLyrfgNRcWlDHH7243oVE3YKQbQHrRZu4dRapdEstjg==
X-Received: by 2002:a17:907:3f1e:b0:c32:9a87:3f13 with SMTP id a640c23a62f3a-c46bdd97afdmr619127266b.8.1792960660786;
        Sun, 25 Oct 2026 13:37:40 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd664ba0sm238744766b.53.2026.10.25.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:37:40 -0700 (PDT)
Date: Sun, 25 Oct 2026 22:37:37 +0200
Message-ID: <633d24682b0cb4d3c25de871e54f1bea@gmail.com>
From: Selby Mashiki <mashikiselby@gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Selby Mashiki <mashikiselby@gmail.com>
Subject: Re: [PATCH] net: lan966x: fix double fwnode_handle_put() and missing mdb deinit in probe error path
In-Reply-To: <20261025203155.455075-1-mashikiselby@gmail.com>
References: <20261025203155.455075-1-mashikiselby@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Here is the additional information for this patch as well:

- Discovery: Found via a static analysis script scanning for
  fwnode_handle reference count imbalances across error paths, followed
  by manual code inspection of lan966x_probe().
- Triggered vs. theoretical: Theoretical (found by static analysis and
  code inspection, not triggered at runtime).
- Hardware testing: Compile-tested only (-Werror); not tested on real
  Microchip LAN966x hardware as I do not have access to the device.

Best regards,
Selby Mashiki
