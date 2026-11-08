Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169409;
	b=ua+3YXGEA2Aym8mpq5e40g+F7AgVWSgT3bRXwbV9FSZNvMvztTzQsctqfp8xMdzYrwep
	 StuGDX+dikKGIepZIz4Ykq+W5uC9JIEefH7bn8l6SiWACFr5ydRDiFTd3jZyW9NDJgUPj
	 yuCV05DECFTsW+DFeam46jyRP78F3lsmwGjFEFO1awA7Stvyky+2De3iX6rQ3nOC6V8OV
	 bdXGp0LgZuyWSeT6Qfwcw2yKifTmN9dXSbSsIAEosvjzUg5TftP0q2GGjFRTY7gP4F9HJ
	 ozC6LGOc6BOYJmVJB05tdPDsF1jhPsZyBn4rH948V10+y81qxGFVVl6Tz6Y23p4Xq3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169409;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Fry9eJzzy71vg1AQvtkXUIwr/MgHXiYsIxUpOdcXEf4=;
	b=yiyXKOo8bx1sJ4ZZftAZdOR52stjeZD4rgj4JLxgpZY1ZDGPY0MPHb03lGCOfyK66b4w
	 W/THDBH2aJ39FIoaPFG+y61/isI7Ayl4ybTH6nMfTDBLJmRcorSGP2UkN0L60oE4Qm6LJ
	 TGW4LTVuPB2r76m0Mp2Bcj8W2t5DERq+7vVuCZjp81MlSOgogTDiHhe/z5MYtnZNBgnI8
	 oUqexlZcXV1WuGOofTMvK0rnra9lnYHzEH1BVyvKJG/F+gq3q1BZwhA9OvobE61mWLCtA
	 OrgYI4VNoVGdpnRWBA2ZqRxKttgrSKh895dTh68svqOUJIIZTI7coaDYVRetw1EMQ0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiiMFz6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73CB6071618;
	Sun,  8 Nov 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PiiMFz6L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142D41F0089F;
	Sun,  8 Nov 2026 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169408;
	bh=Fry9eJzzy71vg1AQvtkXUIwr/MgHXiYsIxUpOdcXEf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PiiMFz6L4D9zQn2vjR/mkKuGiS92thhFNY7+7nJwrVS0gqmSOTMYlbJ0OIC6J4KSG
	 FsaOIq5AtrzaDp1r9SiyeOho+LIViIL3TizBWc5tl6/M67T3KhEVLZ+3oDaf1zE6Uu
	 ONqCz/vWqXddDGocGrDPJxlwkqtFXNyqHVUlOt/NbRvcUsmqyFviJyMopffpEjEh8r
	 /rD3WBQGxIPDXNlDXV6u/pLu1OqPdV9yvQHB/a1dkIgcDR7yrPa7CFLMuGcXPptSH5
	 B2vBBDwtJynlwLCtp5opOFNmI5sMnFrYrId39R++6Qaou7gyQWCx8pln2252Nk8qsE
	 WY/iZcoFkc4xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Sun,  8 Nov 2026 14:20:13 -0600
Message-ID: <179416929448.628393.15447486169053928523.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
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


On Tue, 20 Oct 2026 22:00:25 +0530, Kathiravan Thirumoorthy wrote:
> Add the system cache table for IPQ9650 and the IP version is v7.1 but
> similar to IPQ5424, there is no broadcast region.

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      commit: ba7200ff3bd8a6e5c34177446d99e504ff196d6c
[2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
      commit: 8d1fd8c9d00f120dc8bd5b18dbf5f254bebdd7bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
