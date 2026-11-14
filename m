Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628488;
	b=xOE0O+Ekkmogmaa8nhI0nSQJoiGxX2zi8ntKIxJy7onq6PS1Z2ghPJN50V4XR1yeRvzW
	 NPAUpOl+F+kKHYzc8ZGIiZS8Fs+6DwjsKmLEtnC0SEEU3R1yejaTTL9ExydP9+HkooCLi
	 7Uf50kV8GDfr4ZQ7bFRXxEZeEk51JYnY+3l0AalAK8TVtJrGS4V+fGTgCc8Wel1vb23rc
	 HSYme9uu6yAc9oqPaRzhHWUPpe6SZa7vL8zoKQJYaHZysL3l288SfgzBqrNK9To815PaS
	 w6liw1JaZWnJEw97Ify0fFo/MvagaAV7G1aCG4tyLEgQDj+jjylEhJxuc/SFhDAfPvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628488;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
	b=DKq74mXcUQEnMhKqJaQnZ27EDNFixfshxB1TUZt8+fTMQJI5ylmU6ijV6hP/c1PJbKAg
	 xfMWmqJUgwLawKAgOrP6uv83JwIQaA0KQTcRl38ku14YB8TPZGwoE0VQRoNRjoV9ZGDjA
	 FPG3LRdyFcuwX/Y9XjZBrKncbfSkJJUXHsuEV57pC+WCtQMpHYuC+nP3B9GN7ccfkJ/yl
	 yU4eXaekQO0IlxhxS1N0vdIcsZvhEadpoBUKQLB8GbBMGodF+kh09LtGSVcRBXUBHeoH7
	 w8PK8sKP1J1aLKoQe8ULkwEO35xqFtHyGPlOj9SfVWBrGKm8n9SZHdCJmcBfwCPErBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=drvc8h42;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55122606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55122606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=drvc8h42
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so928922a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628488; x=1795233288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=Bl8kfsLPt10K9ofaAbZTwGWwIo9+9d3zOa0wTZdaNXs1rmB1aw8TXwi+I/KoQ5GqjS
         uJKp83ctpuAV629ff49NoXa31u6kMXwXLTeMtoYVwhgEKJ7snpq39oK0+Bqmgy2AQx5e
         MYVGfhwzGJGE98zNltRLm43NJg6ljBdYHOfuD4pdk3xUz5xikrpC995Bwrca5CpHEk6P
         1mO8yrVub+vVp0szYRFiVbAgYM93xuXwLoy9awCI4Y84qVm4sA6XyHEOPegZbIPvp6XG
         3Y5zzlV1EDqEV5dzBLveb9iIE/k9SJd8NjFD+e9AiTn1sxM2l9uNaSgQXbKOHGt3+0kF
         ztuw==
X-Forwarded-Encrypted: i=1; AL+hErEj7sSXHuBDryxy+HP0lHCXxrF9a/WMiFsoSCUuMXg03KBHnuTSMrArhnCs0nb69Xsp7ClyEjXIuWr51GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8630c7QL+4jLsEhlcZNL4CulnzGWN93GBHafU6u8bAqKJJuW+3
	o8YAvN/vn3D+Nov7joPEPLsU99gpPw+wuWrAp06S++5s9rtz+SzcHsu4zqbyvAeZ/CYQAiaL6sA
	z5lhaXxpqbpguCNUQWZtDm5FFgE5LzPe/H/ymp56EkcvIa15QtJO/xYjHcs4bABGhVXhDo7M8G0
	g2PVeq9PSjxfje4hjgMFM4Kk5+gkjLcrvqHvQLgLSrNKYdViB8ZpnpHiudTcSFtPhMxpDliSW9z
	XFL9wEpG+hwvXl6qaDYN8J1
X-Gm-Gg: AYBFou3J45uOGXBoe1bmPdqicjhz5MFEOHAReB/LSAsuTtBodkhbYcRRTzxy+a8TzbB
	dYnr6veWWrmcvlE4gBpaRildHNICzf1xm/9wJCVg4EWhrA3FmOr4L8M/2jsBbRQNZB59m9XBeaC
	fvcIeDaUFFoH7XUv1bpMmUUfKEsfyqY/JwIONrMoExI5RxH53bFlBFA6TsbHUykDL4ygu0EtnQ0
	GteU8iVe/9DVYMHFfgfRUi+m4pjFPXubr+by1CJ7vTNpe5V2KeKMAqGYEKOSZv3jxMrbfODpVKu
	Msh1apgs3W/wkAgtsyfcHrXNfJmknrsteQZdkvTEOKZHX13lO9YVi0oPZha9HWuY0DfWwqfzP4n
	luTch6mcRhwQLfg8CeYayywykR9wfOCCeHl6FCsJiMFP6uJ3aguL42qtqneZWqFPPC6xgOluWCk
	mlnGZEAubDy+1qWiu7DRJ73FI4N/jPgND/ZvnVd0XyLoM=
X-Received: by 2002:a17:90b:2d44:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b1b0b5c014mr2997960a91.10.1794628487560;
        Fri, 13 Nov 2026 19:54:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9171412a91.7.2026.11.13.19.54.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:54:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so1012873eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628486; x=1795233286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CneFnAjFutRrGEcU3jb+M5OY+ibrOp6RyZtxs6jTIGg=;
        b=drvc8h42yhln/YjZe7shg79q5++pGd63cnYsqkfosID+NFED/w4+2Ib4pK3Dm0qtxE
         +/7KCpYXb07Xuirl/UG4oG3BAxtTHlSit0XukoC/24QS7p3GIaDEbmvrjo6q856LTlLh
         Lv08jV43l6yp4LO+GFXaQAx0KF9JmFyLsciVs=
X-Forwarded-Encrypted: i=1; AL+hErFljK4ZteXhdUeJalvUn7+xyvAlaX2fyKDFtlGXM+p4JiX9bItW5CG5XUYF/YGtHcePmh/aI1kMeJtp68E=@vger.kernel.org
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727039eec.25.1794628485908;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr9727004eec.25.1794628485231;
        Fri, 13 Nov 2026 19:54:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12842438eec.14.2026.11.13.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:54:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: alamo: use qca8337 internal PHYs
Date: Fri, 13 Nov 2026 19:54:43 -0800
Message-ID: <20261114035443.879552-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923183912.13389-1-rosenp@gmail.com>
References: <20260923183912.13389-1-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 23 Sep 2026 11:39:12 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The QCA8337 switch has a managed internal MDIO bus for its built-in
> PHYs.  Move the PHY nodes from the external mdio@0 bus into a
> subnode of the switch, and mark the connected switch ports with
> phy-mode = "internal", so the ports are linked to the correct PHYs.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
