Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169447;
	b=FgYgrLdzpyvda0G+DaV081MGl/KcsXGlzwFqupmC/6HdVqBwBw/BCvcTfdxEXQhM76Kd
	 2iDqSshZkRr3UN60fWBqr5Df0Uq5O2nfxzhTTgZhjStEG8w1a8KEzoGh0pi6GzwBZU+Bg
	 BbaU+YiFFZxCmTBViHWCmCYcd0Oe9VU2Ag4Tjxw8rvL2KZVD/aQCX877e1kPs0nEH4fH7
	 pELBspZBoJBFnZUPy9Fln9ZZPQvMBWJi3PSalLJWc3QMevYqpBSv77fshjIatdq3EC3re
	 ALxEaseV/wcyqQttn+BTtdK5L765R78ffzp/ZNYBNpPXiJWP7qparCCNK7zqLvhm77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169447;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R9m0ej+M6rwW2kEhq6ItZERhSjoW8UZsWXWt9jB/7LA=;
	b=ic2/UXrqUsL6b/CDYqLT1or+3QTGspETcTeYxrPRotdz9tkvl8fqAhAGWHjtVCSzklFB
	 q/GsC44vn7JMzlAENrNz1swduQwpf7DUAONv2K7x+QYh7qVwXX5MLzmavpIVoKbITL8P1
	 YFNbZkJDOYyGLG64Otyvo5twL5UIDWR/0ljV+sde2WjmGDLj8z3BnUlyyHEJzMyB4q2bV
	 wtbgo/WWutIFcfdJSb4SMcoF5SyCO/ntsdQnw38koWPrsQMUGkNwnebY7i21ogQpEuBaD
	 ozfcvviOF2zdQ1NJmgHz8T3ICU73V7q+f9YmOU3QTOn+naqww2NOHpx9E2yon1BSOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3va+PkZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE266076C2E;
	Sun,  8 Nov 2026 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3va+PkZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC0C1F008A3;
	Sun,  8 Nov 2026 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169446;
	bh=R9m0ej+M6rwW2kEhq6ItZERhSjoW8UZsWXWt9jB/7LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y3va+PkZC2OJoIdKqX8YUyUbptWLJk/yNKyIskX/rMJh8Tz7iEKsgBvdRG7kf1HOS
	 IB+bsiqg2jkBlBeFj6wA0+qMWkq38D/5ZgSS1RWvIb56isdHcG7IiwvN6N9gctLGCQ
	 gfbbs25FGQtDagCtLcmgrGKH20qFY0S3zAb9niqv1erq3hgwdWrpGq5YBzTk6eFQ2c
	 6jPqT81xeUqfc0hWcYLGfMlCTzxLwDWwa3jwU/LcVJEuvcehc3uJgjXsin+qrEIqSB
	 nn4hHMZpiJ+RT01EisWO1VjrMuQcb86w7o3aiw3GJmJ/1rheeW1CRM0Lnpis2rsXLb
	 eFNmzRqEOAuXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Demeter Barna <me@fromdisposition.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8350: Add CPU capacities and power coefficients
Date: Sun,  8 Nov 2026 14:20:44 -0600
Message-ID: <179416929360.628393.6755394637563467923.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
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


On Mon, 12 Oct 2026 03:56:03 +0000, Demeter Barna wrote:
> Give the SM8350 CPUs their capacities and dynamic power coefficients, so
> that the scheduler sees the three clusters as they are and energy aware
> scheduling gets an energy model. Both come from Qualcomm's downstream
> device trees.
> 
> Downstream, the capacities are the same for v1 and v2 silicon, but the
> power coefficients are not: patch 2 takes the v2 ones, which the device
> tested here (v2.1) carries too. I have no v1 part to check them on; if
> v1 boards matter, patch 2 can wait without holding up patch 1.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8350: Add CPU capacities
      commit: 191cc2c880edb967476f8ce2df1a548e1cbedaee
[2/2] arm64: dts: qcom: sm8350: Add CPU dynamic power coefficients
      commit: b6ba6ecb6c8c60c9da8d67e587ad31d752ec168f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
