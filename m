Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169520;
	b=CFoIIfRL2v/OSjdImfIbOCygLcOjPGUSV2XUd//4vqFgdSQsV3dDn7bXUMeJeqD+vQDP
	 LPdQLOyUihZ6tDpSCNpqZTvMgpgk8dO8F8ph62Bi/aX6NTxjf/aS/K1p10PpSJffES0gf
	 M59TI2M/7bh8vVEM/q33BO9aBEU1JOJZHpzkpGp6Il0PcnrmcgRLPYKFXS1hTP6GBLeoN
	 C5m/M1umGZiasVeSeFYbvgoTFwOuPTFRQHcuQY0haRrgZMDb+S4CNjYwBxSM2ZzFxlttY
	 qfAyHhcuhKngFW2X8bFt7Fcz1dcfoHo2qNM7wx90QkX9lqHxl3yQb2kC3SiWU0Jp/EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169520;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLvmnC851A7XbGCzsRFhco3Qk9QcHGmyD6fbbBrT1HU=;
	b=0K0HPSwYRboCdNpSqJ9ILXWNtATcSzy7Fs1pZVePo0SXkp6l2aCLlwIFgnuOR4deuueV
	 UGEMgQT6GLEgYtWokMqza+Yqci1RGcfwaedbNgm3beiJrUaMOe7IRv56+Jx/EVx9SJy7+
	 4uiCgyMniJ1cbUCM8gA28qsY3riDmq0IAtpDKyf0Bg1siSAscIq6KhUbxQ0ZnVN2dh/9H
	 RUTHX0y2ffBdJnkPZbG/3DNHg+HGSIxx6HF3ykk9eUDpO7ZmNmDgKBQtDfXChSAPORGng
	 Y1HWKjy5uFi+TKDMALIK/IZzGQ+CCPJbO9R33kvfucjPQJsN60ltlKRB84yqh1DuZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsHvYw4b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8D606B108;
	Sun,  8 Nov 2026 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lsHvYw4b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B611F008BD;
	Sun,  8 Nov 2026 20:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169519;
	bh=aLvmnC851A7XbGCzsRFhco3Qk9QcHGmyD6fbbBrT1HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lsHvYw4bLHBeSz1CnFlVfpfhlvQ+2J00fZtveL+hAacoDNcp2G0l3r1BPUPndoSOr
	 hdPTVZk3buQtWAggOgDdRXd+2ZaPm3HGo8CnVclSqvqp9iOWJLgQC66nQA8sZ5RRLU
	 Ejz6QUV/+fXaqoVAuBK25F14k1d8zRnJtt1L1ch9DSFEnHVxWyetPsw1/ojWJo9hWn
	 G5e1zMTX3nJMXq9fOU1OQo2MHx4FkqSj0e2XTj2MzJcoEDc4/gSoh0AMEDnRfA0Z/S
	 T6QSSBYRX9Bt5fQbhKASEyu+F3SZJ21qBNXUkSKhI1J6GlN5DiHaPe5h75WgexkBwb
	 qYekn4JwwERww==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power domains
Date: Sun,  8 Nov 2026 14:21:38 -0600
Message-ID: <179416929438.628393.13491263092245796078.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 Oct 2026 23:37:18 -0700, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Split cluster power domains
      commit: 2f8809488d2a563ffe6783269a8cd6fe5cc4e114

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
