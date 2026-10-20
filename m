Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461190;
	b=Gx7ZKvHaKDE7iv4nFLahx8JYaUbl2O11iH0FeQmkrq9thoV8VVR8FopyEohHoucCPQPu
	 76D2riHL00a40/0NC6LMwHMSpJ9YtRJtz0npk0B2jKoYH3DrKFNn201vmY3YSmx99Duty
	 boXPcdNMWmgIehekdMpjvJvMGDCHgESZE2BBhWmrZv2AK1lOu3w6YBw2RWlHdG+bYXLKy
	 RunpO2B/9k1VkOiOmv9r1MznlVDeQc7VTnlKk+xkj2JBTsZ16nM/8Q2qJ7jOC/3xEBZuR
	 kk+905eZPTzhYBW1g89HhkoqUX7FjaYQhOwymzwNHJdb+cRolxEYDlFQC38WUlDiuKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Yn7QqCwXM8MPvwetBEr3NullDr5Aw8no0EzlhyW/Hc=;
	b=g9tO17zxFoeQQaEZDqDzxzLJYVVk3KHIp25YsovhXftl+M78uKwcWUIeFTmAvykJOIDk
	 wcohstsKUcYHTqLvewGHj12A2iJek7ydDpAXyFu4BmoJvYdq3AMLCQNzGh0qfIMUTnx4q
	 76s3MThM2lswhMT9FH+u4+bj93gf2dEqGWxCaZB0qpwGDAxOhk5dwpv4pP8JWbaxFvwQC
	 iMQ/co+IqiNKx2gHaQdkdk9SonZ2cWoEgk2M8wmGnty+T5r5o/uTW9u3O5mN9RO1lzJtf
	 xbWjHCql7Bw3swPrwraUbj/vYHvhQRVU7C44fsn5Sw+u4NlCoxVfmp2ssdy1P/uj3eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1614077b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792461178; x=1793065978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Yn7QqCwXM8MPvwetBEr3NullDr5Aw8no0EzlhyW/Hc=;
        b=vumXSNSbI09RrtlcyVULpvJxp0EcPVGVRu33CuFCqb5NorLBDg2EPhJOoHYzUwuz+f
         LxFgMsXL4GijHKtAhN/BqDlE9Qi3p9hYGCIOnGKa88rE5jwPUubOQuBXKPgdeQvryF6z
         cTDvY0P/QacS26B23naXpIrswv4zBJYwfkVlFWmLaxxCSXRy1tdPB68EMsLumnwe4A+g
         G5/PQ9b/87L91T4g2NUgqRe1o38gpLZk5NtO0oQnzCrT9cPThXF1ofoiQPSgJwbByVEU
         RN9xqUVimW85F1iDXLYkovAABIPAD9/xGN42NYO9suCDT3daOKBldwleo0F3DxjtA2L9
         ggjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461178; x=1793065978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Yn7QqCwXM8MPvwetBEr3NullDr5Aw8no0EzlhyW/Hc=;
        b=PEy2+poZVvfd0OGNDHpTisRtHoeqAEZHTHpeNuR5Om0CWjth44sQbCWc4AXYIVML3I
         AW5+J5Gimh+1fk9USWKUv1R39dmvJSBS8xhn6h6I3WCpXk2q14fpEhKXeGUaHNKNLw5H
         OkdxPYVoMKo2V02/zVO+no8eBxgazLDFT1rtQCRdmOY3MtnTKusAjIt1LfFacuFp26RT
         QQtJNXJnBP3YVNDLAK+Q/V+GnNurBEYkuV85kioYTQiv45USP8b6yAdAY87ZONe+9sNf
         1psIHxoNqCwQ6K4g2HVqEH0gAheqebT0abkdqagj0qpoZS52q+BlKvSJ7mNbbFbOt8NO
         ui7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVX5uHVva5n896EMoxBo4WjhQT1omzS0oRPXMS0PXTmoa17mNr2k3ZGAm2WfjduPj/AyJhIkvK1UKs3bQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzkhR7yQt4G6Kr5Og3nS7yPxRsRmFKUxrpLxdWEbgNLQFWcrN5
	ILEnArTEbBPRGo0HVEaKEa64CARRi4Z8uuqQpEm444M/RknQOHIZphxVPWvBDoOdsD4=
X-Gm-Gg: AYBFou0tobSl19QaMreFGdNQZ4m43hTrIuYTFxV7wXKUqRviUVJ4smvPH7K4eCQEIkP
	pkqYqZzMuKeXd+WqHx0YLxZFq6NuLKe5d4BcJXYrms9/DkU2W3kAx8Wx1Hz2nDbNKfceTiaJL4I
	ZOue6M9Zzs4gM17u3peyd0sz1iCWifjavFSPl9t33RSlGfuLGFAeqdePC4l9jAbIMphFoH4x5Kb
	TTzuZoi9WRjxSppBZjH7mthvCjhxczr08C822ErlhoNcqtoNQcVAGsNuYRmiE8DiFcAZbk+49y5
	y1wCY7pbmJL9OJew0x9al0v9MkClkHO/zp9UokL3F+jpac6RkPX+dXtL76CbOCvNe2xD9MQcSNn
	tzQPwC3KvXq3mom9Fmf0ocmFq54KMctKrJ0CjEwMybxpBc2L9JTnWHw1FNArW28dqPwoy0cFVJe
	dNQ/LgplUeN148oVmFWNQ9g/cSikQK57uRZ5ZFUx8Lma6jzJQmgtZag+xJhN48UCAMxLGnM6K0P
	aYNQg==
X-Received: by 2002:a05:6a21:3947:b0:3e2:1418:aae2 with SMTP id adf61e73a8af0-3e22640bb6cmr7707121637.68.1792461178034;
        Mon, 19 Oct 2026 18:52:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a15c57sm4551644a12.25.2026.10.19.18.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:52:57 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Fan Gong <gongfan1@huawei.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Xin Guo <guoxin09@huawei.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH net] hinic3: bound the Rx fragment count to MAX_SKB_FRAGS
Date: Tue, 20 Oct 2026 10:52:45 +0900
Message-ID: <20261020015245.1117139-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020011209.13736-1-gongfan1@huawei.com>
References: <20261010030901.1712792-1-yhlee@isslab.korea.ac.kr> <20261018170531.bILLh5Zw@linutronix.de> <20261019001037.3496843-1-yhlee@isslab.korea.ac.kr> <20261019221306.d6dfPY_y@linutronix.de> <20261020011209.13736-1-gongfan1@huawei.com>
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

Hi Fan,

Thank you, that is very helpful, and no, it is not urgent. I found this
by code inspection rather than in the field, so with the current driver
unable to reach it and a complete solution already on the way from your
side, there is nothing that needs chasing.

Please go ahead with your own approach for the larger packet sizes; I am
glad to drop this patch in favour of it. I appreciate you and Sebastian
taking the time to look into it.

Regards,
Yehyeong
