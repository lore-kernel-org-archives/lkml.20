Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47671282F36;
	Sun,  6 Sep 2026 00:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655281; cv=none; b=j7nz0NhVHM2i30LE5eNmRitHX3p/7MFHPhhRzQklzvyJwGXI2r1ZKhiIfRYuS8VxHxTeo3NygSOIsdf+nsusuMAGGIP+MlLmtyxLURE49Atv5g/BRWr3Mcf4COKSRtn2EjihMVnMgr4ERLX2iEfM4qozqAw84Cs15yLEnDVx5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655281; c=relaxed/simple;
	bh=MHM9Zvc1pqohOPPF7JnxMrqozgl8vZ6KSpJMqAU8meM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0TbTfoQ5L/GVKui9+OVFTAf1EzTOuJKV9r6jXsiv+UM7rFgaCTUKlaZyQft2Zh00w7ilPc8B6vZ3NKa/wUbTPm+clCVgV+q2IoWa3+x9vHiP+nka2EZ87wdW3TQEdeq6B1qH1vWlMJlNwo3LBp1cUJyirgLQ9azn9Z/v35kFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyIwut1N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyIwut1N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6157C2BCFC;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788655281;
	bh=MHM9Zvc1pqohOPPF7JnxMrqozgl8vZ6KSpJMqAU8meM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YyIwut1NlKFWAlOAfnx1QkIe+/OCB+30UGRsBHeUHFmfqMQIdAGOFMaSeAysSyMrx
	 Q+a4UJ5FiXxpBjzuqKoxBFVgKBH881/1jMKenYpgIFphYMqxvWs0DZEG11dCsJNy3L
	 kyaZllj3r/ZlnypqM10WzDdoudAKbPz2orSYgYvCwGE2qMSbpPvMKDLJR2AXfkgWtN
	 PYvU/7XInPMrDk49PWFmc24WZtSRYSn/F/mW0wKELP8cGjii3S4ND636/qG9yMNcbY
	 1645oFnLVhmy8LUs4NbeQNvIzh4b4vaExhTD6/gKq62bvlf+a0q1Q7bNcYlcZZM3PI
	 cDMvE0SUvbI7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA49BC79F85;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 06 Sep 2026 02:41:14 +0200
Subject: [PATCH RFC 3/4] arm64: dts: qcom: sdm845-google: Add modemsmem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-modemsmem-v1-3-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=b+1IVxExDwgj47OWR0x+s35O/UGQ7JVi4BXYWVb7qSY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnLav0FwqvuyDjMDjQqc7bKbewTR3zwlTsGc7i
 7Yh1MVDvLGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapy2rwAKCRBgAj/E00kg
 csW/D/42fuQ/V1IPHNOfmJkuKvyDISFWUD+KCOWuWnMo6Fg8VcL3plpAoRM6qzReXDd8ZYtjoNK
 FNpDCVN0MxeUtdqNomShgpNCoe0f/dIkMflKBw6NYKjZNkrkIkjARsi5z9CMCWFS4QWrfQPhJyz
 mpnqkneOswda9DPw7iLi7X6grKWv2Py3wEmOnlB/4KPEsufF20/U06UX3vlVAKtcHRrwG7mklwL
 NlUV6qxWhg8YpiVHVpVomNrGBdb+CO3esTI4JoCiOgLyeS9JZUp5tsvzurOdI2O4VOqJ0Z7woSt
 s0tVrJOYIuSrFGl+jOFfrcXBFQHiy4iDEUpxQWw2trrogE6fVVKGFTgrQI8xYwI3n5jqPHFozij
 /G+SdfqVUU9V8P5RqeYsIQPMCy/DB2e/cvfTTDIyTqbTtbPFmni2qDAHU+JmF5So4lXCL4hgGgL
 hnwaaTt3yOs8rTEYWYRpTG1fbr0Zt7C+b05KnW5JC9Fy/pLYpZkJp8q986lkP0BItwnoWm2aarU
 G8ulGHxztD6NxFCRlPJkE4sC6MuNaX/56cch5wfvO16OGybyvCs0JZk7hRL8FfndM5ENsKMf1M/
 iScz3gwxWXQqWtS0kOcXw0AR+F2XEtahZviF5adqH2BWYTx+6m0isAUIu5mXqvUtscCPVXosw5X
 UJ4Mh/NG3bxjJCA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Pixel 3 / 3 XL modem needs the modemsmem client. Add it in the device
tree so the modem can properly boot.

Based on work of Casey Tunturi.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 9e952f9862f24..7e8f1a34a79f8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -45,16 +45,21 @@ chosen {
 		framebuffer0: framebuffer-0 {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
 
 			format = "a8r8g8b8";
 		};
 	};
 
+	modemsmem {
+		compatible = "google,modemsmem";
+		qcom,smem-id = <134>;
+	};
+
 	reserved-memory {
 		cont_splash_mem: splash@9d400000 {
 			reg = <0 0x9d400000 0 0x02400000>;
 			no-map;
 		};
 
 		mpss_region: memory@8e000000 {
 			reg = <0 0x8e000000 0 0x9800000>;

-- 
2.55.0


