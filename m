Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356044218B6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135933; cv=none; b=KLF696vVcjcQ2eXCqWX58atMgFcIdmmGkDuV1JDSwm99DH4rUmRCPNmkgo6+V12TdtY6k8asmYIdZTfaPVcCibrqtPRvlZwqoZT49UkXsAIiYRkcMhvrV76TFyYyyfy6Wnv1YavIvs9dM0pjR23Tn8MJR4JbttvlxK5WOLIIDZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135933; c=relaxed/simple;
	bh=9DtZpCIRDOliA3QoJp8RXKIGTL5jZ5YPhYQMEBLV5GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uF6j/pr8WLqIq49HFBP6O282ZvOhwCeBfoWVzPK+VG5lOrenneYsLWFNbk6tItmXqI7eT95Wws6jozZvP8UrJrJUfVJbR/b+1MwiR8oyb2uiYsiMgYtumIp7TiinT2WTFl8yky/k2CDEqgZVeHZQPzXC1+nD/CnTxHIjzPRl1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=qfW4Whzp; arc=none smtp.client-ip=95.215.58.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="qfW4Whzp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9DtZpCIRDOliA3QoJp8RXKIGTL5jZ5YPhYQMEBLV5GY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135929; v=1; x=1792740729;
 b=qfW4WhzpArFPt1zqbj5s2a+Pc57XVkwgMEMfdQBZQ1T2zX4kInSSHx6PCX5q9nP6tc3eNJ1t
 f21LeDeMhU+y1mLiXPcQYVtCfb4oNaUpD0wHcsJ1ul10nG8yRAUK7YJQa2aGvhCqDRPtwtjQPUv
 4/baIkz4gccd1lMn8Nib22K6ixP+ZF6jVR6nq/bmOZcKdbTShLtUOvzm9IN+GGDh8UTDD403j2c
 SK+REqQkQE1xR7yylzH2Ga1o0qbdj5qJscIrJv3RuNuN/Cgu4W93BeaTxa+IHyRwXbUn/xXf2I2
 Ai+QpigaSc3uVX1ik1xcpLVtk51sb0pMtk3fPXp6cLRNA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c249511dffadb7a4;
	Fri, 16 Oct 2026 07:32:09 +0000
X-Mizu-Trace-ID: c249511dffadb7a4
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Enable soundcard on Motorola Edge 30
Date: Fri, 16 Oct 2026 04:31:48 -0300
Message-ID: <20261016073157.611956-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables sound support on motorola-dubai, at least the
speakers.. The WCD that handles microphones and analog USB-C sound
is left out because it would first need:
https://lore.kernel.org/all/20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com/

The senary MI2S patches were previously part of:
https://lore.kernel.org/all/20260506204142.659778-1-val@packett.cool/

and that series mixed up too many things and got bogged down due to
the TDM stuff that's not relevant to this device..

Thanks,
~val

---


Val Packett (5):
  ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
  ASoC: qcom: sm8250: add Senary MI2S RX support
  ASoC: dt-bindings: qcom,sm8250: Add Motorola Edge 30 sound card
  ASoC: qcom: sm8250: Add motorola-dubai soundcard compatible
  arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers

 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../qcom/sm7325-motorola-dubai-common.dtsi    | 119 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  11 ++
 sound/soc/qcom/sm8250.c                       |   9 ++
 4 files changed, 140 insertions(+)

-- 
2.55.0

