Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E13EC699;
	Tue, 29 Sep 2026 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651798; cv=none; b=DH/gy/M+3VhY9UjKUix95gb6+3ybihy39U3PLKY7r/IDrr7MyA6qwpI4L9mtFWjCcdZN55Gki+w72F0LXx80UWLnihys5VeZJFFVh1B3VLrmSaiIjIICmaLf+Pp3T89iMqqjzG2u4Eio+w0CoonIWa5dAYPDQviUlrW6WnBUW+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651798; c=relaxed/simple;
	bh=6dMLeQdO5pl0nr47wIjruX6S6k8MhWUxHigqRiI7Sfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbixwqPVqQGm3qRB7fHa/MJE5dFoO3RCOm4Gto/0LK7P78aIA97v+QQCcSZvhRWO0UsykY5OAqgEJsj6PWQGSkSQDm62IRpPy9bB2tm38yZ2kAQe9vJ2Lj2b2lpWhZIJak90XX5aWM6TLsh27KB4VGiWq8H9r8uTt6acc+bGAxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W83Bdj4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W83Bdj4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB6D1F008A4;
	Tue, 29 Sep 2026 03:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651790;
	bh=vprCGAa2wd4gq7G34edsU9r2Pc21mQ/emg9lNL8v8Ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W83Bdj4qUOZrG9Pq2j87YVMIUyRHHKtn5fqchNO5Q3+YXIuNx3SD21D9dCyiFMn4B
	 /lxUorlxWETuCkLkHNqSJATCObW6VU2rFJeO/lPR/AH88XjQxjlrgUyyqGYRkae4/u
	 DAUevKJOR8SCG5mgYSyGyrSPo/eeKvAhO0saR4XEnt0e2C/aAC4s1SFkKCt82X6rXf
	 jWkR5DeCKgl8hO2PI0PT2lUmDWLU1/ZxLjx551dGyiZVJzlm8GfuZshHQoIK9gwZt5
	 YNSzxOFGbx9MICzBH69/P41P8Wrjq5w+1YAXo+PGuU//RVIFzI5HmB9fXL3U9yOwhT
	 mVsBg+8ThKblw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Use hyphen in rpmhpd OPP node names
Date: Mon, 28 Sep 2026 22:15:18 -0500
Message-ID: <179065170948.2673486.15346411316948283756.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
References: <20260816123648.1632681-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 16 Aug 2026 20:36:46 +0800, Shawn Guo wrote:
> The rpmhpd OPP tables on kodiak and lemans have some OPP nodes named
> oppN rather than opp-N.  On lemans this is inconsistent within the very
> same table, which starts with opp-0 and opp-1, then has opp2 and opp3,
> and goes back to opp-4 and onwards.  On kodiak the whole table uses the
> oppN form, which is inconsistent with the rest of the qcom DTS files and
> with DTS coding style.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: kodiak: Use hyphen in rpmhpd OPP node names
      commit: d27d7fe39ada945129f075698ea4f50bb6df8eb8
[2/2] arm64: dts: qcom: lemans: Use hyphen in rpmhpd OPP node names
      commit: a469c17e9119a239b85f5ae578d39f17d140572c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
