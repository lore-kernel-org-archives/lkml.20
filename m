Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C737DABD;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130478; cv=none; b=ZAvPxbss6MvF8upqcNwdxrlT+AYNltqcIAMD60/Zx2KpzufdHf/vMkqTaPK9iFbbut2O8YES6bCJC8u74epaUtzcpTU+7lXXJZ+23hrvgdnYUe5omSur9eGkiblj25wHRd4LfXyhRuqL6T7cvXHFiXx8nP5qcC93K2BqxSNUfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130478; c=relaxed/simple;
	bh=zaVfJ1YgBwAelENSTsicW+btJeqfXxKfuym1Z88hnF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZSMsE7lMyC2Q8ekv2jT1RVt0E1NIMe5H21uolNX0jJw/tnXHSeiB9f5jRhEkeZXsKAdm4iDkpYB4eD95k7mg/DhRMoqn8ivfeu+JtGqQV/z0X37NxVG4OmmAj2pWp1MbVS8v/CUkf9Kj9Qh6T5u//iFcs1dVVKESMSqk90qM+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifK/dnHF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifK/dnHF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69BC2C2BCF5;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792130478;
	bh=zaVfJ1YgBwAelENSTsicW+btJeqfXxKfuym1Z88hnF8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ifK/dnHFl4N8xYKAzGyFDvBX3JdpbRAaTwB/Fqm+J3+5uhYMykB/tLD7gUD6/XMci
	 Nw5TtER4ouJQpENn+QsAvvOYYpCZh6VZwL2KpFc148QwPWQh7QDaY/M//ALk35aJG7
	 cETvSWk4NZAnW4TPcXJ8jIKN1jZTZBL1XU/S6BS5LGqL732cDHpy8zcFUbiG13B7la
	 xukycOlzpe5yLgRyXD32qkh9tu2IaWke9qIvpwYPVyszf6AszwEhxJjrEbf2TpaaC1
	 HwpZlSNQW7f4WX9E3/mvfkASk4MNzpPpZX0Z8YTCPTlOVoHDex52KwcOjADBFZCI1O
	 vFWCXwTqxHyyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59425CCA462;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8350: Scale L3 and memory
 bandwidth with the CPUs
Date: Fri, 16 Oct 2026 06:01:14 +0000
Message-Id: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mz3eJcC2NTA93kglLdpHJd8+RU41QD87SkVONEJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAO8LuwRxAAAA
X-Change-ID: 20261016-sm8350-cpu-bw-7ce3e07fbe3a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792130480; l=867;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=zaVfJ1YgBwAelENSTsicW+btJeqfXxKfuym1Z88hnF8=;
 b=ex1GhzDFwT4n0sAH6MOl8aOPrns3QazXQXvFVVWYVECkocbZgsNugkcij0KbQwSlsiA5Sz2sz
 amHmSijzS4xDKUYUCSGqJou8qLOZM7AtYYK9oAO/VTUxxZGtXII8kEA
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

Add the EPSS L3 provider and CPU OPP tables that vote for LLCC, DDR and
L3 bandwidth with the CPU frequency, as on SM8550 and SM8650.

Tested on a Razer Edge 5G, whose board support is not upstream yet:
copy bandwidth on the A78 and X1 cores goes from 8 to 22-33 GB/s and
DDR latency from 200 to 125 ns. Idle power with the screen off does not
change; with the X1 busy on compute alone it rises by about 0.3 W.

---
Demeter Barna (2):
      arm64: dts: qcom: sm8350: Add the EPSS L3 provider
      arm64: dts: qcom: sm8350: Add CPU OPP tables with memory bandwidth

 arch/arm64/boot/dts/qcom/sm8350.dtsi | 347 +++++++++++++++++++++++++++++++++++
 1 file changed, 347 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261016-sm8350-cpu-bw-7ce3e07fbe3a

Best regards,
--  
Demeter Barna <me@fromdisposition.org>


