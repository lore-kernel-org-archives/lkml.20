Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205530;
	b=zCYn7H3GsXOq7dZYdTGF3dd1R7D8aONiYn4xgr/7AymQkpJtSTm/EEMEkzntJn6OfW1b
	 d4AkL/wpkMtcsEAq8WpD7HX/gT9sLUJbJDBjIyFRXyMNvphbbj1puT3KOurESCTaxzEx1
	 GkhjP0NFKFZCBB1uZlI8j5wG5glnHDt52nc3qamjNla2isSXtqsslqs3yC2UFOnpoTBRJ
	 a7UjCGbT6fzm3viSo3rk166UaT3bBZHqeQD+LlLaxJ9RfnnhveCy901L+Z3NoS4Xq8V9y
	 JRVO+MUrXtEXOfhJVD0308RL0bN4taO5CxAeFF+Oi5FbebNp8gG5oiuYQ/QIKGY64rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YYg+bgTYV9ji+xIuiu7GqnBDXQOUfklC31rXpMn4A4Y=;
	b=hDqdzNB550Yvy54w2o82c9r/kqfxfd3C6WID++vbfyxGgfYPlDhe03yPQjuNZtlEy7tF
	 5L6DTTvREZl7Da/J7gxh0srIzvOfMegjywn5fyXtnRRxxW6n2MHvLtXtNUYHPO12y+29e
	 +GydL1MwQGKOcf9iLUGhqG2Abv2PFPI4AW/t0cRg7WB0ayIMThoRSmq1bmRhCuEmZRP1l
	 pET8jxa/onXF14RRBvARWuJR/U0VYOAwa4HBwWGtzqDwqLRAqnxOJCAQpnRxiyEG4rGSN
	 Z9eHGCiHC4Q2AbBf1dqvWD7UJ8FJys36g99VTIY1T9pSnLEjM+ZZNGBwWS+hzNmOdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPXilkf5;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03B606B28D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E03B606B28D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPXilkf5
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb040841a9so162155ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205530; x=1793810330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YYg+bgTYV9ji+xIuiu7GqnBDXQOUfklC31rXpMn4A4Y=;
        b=OPXilkf5W2mSrES/eYAou3I3925xBOmvAKuFXCfpSrnxPLnj4kUMLpI+jLbIXRhBp0
         Tt0n9dCUTuUw8+ZO0sS3kJucb4xltTp5nfTz+RJDWmJduzVdHYqQOd18bWatWyjnNovE
         YlZCPG3PGfuoMn/nqpAYtqGfP03M+3OSETEe8SNAH7VY91zPeU6BdgPCaw7u3EZmO7vY
         RUkAZYxo8g0xeRYpPdlRVmnVn5D7sjsWuZkGbk9BiCb0oSCZaraD8+H9mZKKzy9GcRFI
         A2ug5sAisBx6jr7IUqNsAwR0TnA6JRYhH+UizrU2Unehh9dbkTbDZdHmIia2jek02aWn
         t5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205530; x=1793810330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYg+bgTYV9ji+xIuiu7GqnBDXQOUfklC31rXpMn4A4Y=;
        b=WNf/18gDYYOEJ7y3TmTRZFHkGHHxaZvTyie7q9nYiVq6xMz2FRp8Y2+0T+AiEOo/al
         hZR82Fb5vVLhGgHQUa3x6HbZUjtNyNpqhjuSI74knf3cs6p/UMaZyu86d0xtfPDi2azT
         bol0vdOriK3qH1BfoNI7UYVp6Y3nGz2+15QeUp6YSJIhnzkhSMociBCEPFndenT1FB6I
         HuILEDHQXILkQDgvLACSTltJ3KICF9CSHsnAZXsFSAHAQpNg85yQ9OMVEJvEv1DKgZZS
         D0DM/uMpHazb4YaExoG4NGLzZOeTh0eylzvTsLLL1OjCP/rI6TnAGfFMSFPhroC/yUaZ
         JA4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzklCb436JgMGo3FtsNjTzLC9FGjW3JpL0sghDHOl7cb0mYc5weGyH2YsPyhTv1oaRvnl0otIbmL1ovg8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZlbW52bZ/43+QiQ7upRGi4ehQuV4YeQIsOAYmHdoYNsRisrbl
	4/BKs4lJpRG931TEsW3MxzD1GpZcQlitumlCJCXhnUCQca3bJpREsxIj
X-Gm-Gg: AYBFou3zv1sD5ioogOZ8V/lvNgL6tkyysDkRNvO18HtsVMyMI6g4lZh4ivl5FnODi+q
	WZOuqK0Ip65TvhVHz3Tmc9uCiXTqY+NKMgLc4cN1DF+JOJ1VytrmJmJr/qEGpZCnAwpO2H2rAyo
	eKWG+jkzcrYZiYLNd/BbUn37bv5ocdL1lHXmGEAfAYjpd8yIB4Guhl5mNcrO+9OmZFLoRsq1QdY
	NeR5GrRqj5KGg7w29fuS17+fvOgP+SHVBFOskPh6mNIxecxD+3OPmjKHnOWxVwfq/AuXyKvXYud
	zf5rYE+Yb3feLFrKEmGAbnFxZB6/gV5ZBHQIu62i8hRu18fDfbaWFZwVePjTqEnBIC/uXIgjZyf
	udVCevRiXoabVYpSvJ0LNXknvTg1j2iirN2L7FqDBEO/2Ytoz6Oi8mvyz5WmwjkkScbQk3U0yLb
	RsMWS4klkj3lw0fu0V2a2o9nbpkO9an4YkQXdkv9U7wXKooMZgq1GQoA+7Rmx/O/ZS5Wk/yd4v5
	gA/v8odiNKU2U2f6/fGy1y2VhNcvsAS5JT+jMQxvmM5WWUlRKHCGxySTqBDf1FztQ1bV6mJxkD3
	oVr9jVI/WdPW5TPnTovYyVU83XBjAwEFJjdWw/WB1U3bL5HfXHZU
X-Received: by 2002:a05:6a21:496:b0:3e1:9071:acb2 with SMTP id adf61e73a8af0-3e913a7ca80mr44385637.33.1793205529784;
        Wed, 28 Oct 2026 09:38:49 -0700 (PDT)
Received: from 192.168.1.7 ([2409:8a1e:2330:4ef0:1490:f0fa:6df7:f234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cc9b25a3sm4395321a12.2.2026.10.28.09.38.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 09:38:49 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests/bpf: cover AF_XDP multi-buffer TX software checksum
Date: Thu, 29 Oct 2026 00:38:39 +0800
Message-Id: <20261028163839.82573-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <auH2iJ9oXEQRVG26@boxer>
References: <20261028025026.11401-1-testwrzwrz@gmail.com> <20261028025026.11401-3-testwrzwrz@gmail.com> <auH2iJ9oXEQRVG26@boxer>
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

Following up: I extended the selftest to run every descriptor count from
1 through MAX_SKB_FRAGS + 1, not just 1, 2, and the maximum. This also
covers uneven fragment splits. All cases pass.

Thanks,
Rongzheng
