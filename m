Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169479;
	b=VE44U3qYytujpwibidf3qFesOsp3p8BT182DUgNBR5Cgi8Ql805uOCp/gw/VbwI3RWs6
	 pLqUgr23E2ixGvTDHB1jKWiYcU62lUcN6NYUJCRBZvmVwfnB+4urswGDeiJkGdwG4Qc+N
	 oY8O/Qo/LsuvcimdTZ8+eZbYuDKFGsZY7VZf1frHRmAVAehbkvhgbtBbdQ1qai9TwOFUu
	 xscH9rvJmFuZcTeEMJQfoQCPzQiRWZ7MDLJFS8hCbaf+tTWTnhu8HwTOb1YgyUJGjhrBV
	 5wkPwflbafatq1vWkEr0E1KqCYxvTH9cFIW89pwdZZnpIJIXrQUUR7e7awE7+vdN2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169479;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MVeGMPWx4KrHUe7VZJoLGYceJAylbbP6L0AbPcFC8wI=;
	b=mq6ePV7SGr3BEGdR4zpPz8rrM95IadM0F/alAPyzkHWHkO0MH0HFZYHtq8alqF1xUPrS
	 Pl6+YDd1rkFOggJKDILs/D1HmB38gMm4xfvjDqmxJrjgGqiRJYS66X7qntYsLe/jEdmTh
	 PuaipzZomE/nUkf5TaKQIZuqK09K40yb+ybIx+t9gVTN4sQysW++E1tCB+w3+O5kUOp7u
	 qzRQGvH532BrrWIeXraAidwpGHa/v0n0dgxZe3atdrEZhQpEvHku3p75I6v3RT8M+8gVe
	 76U+iWahXTjuk/mAt0Cb/TFyEZJ+v0DfFeDWXG1Lym21HMMRjz0WCVPnnfdtlfpkjZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/4AsMyz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05438607D973;
	Sun,  8 Nov 2026 20:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/4AsMyz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDC81F008A2;
	Sun,  8 Nov 2026 20:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169478;
	bh=MVeGMPWx4KrHUe7VZJoLGYceJAylbbP6L0AbPcFC8wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a/4AsMyz1VBQuudFLFcZUZmjUW3bg43fuw/JvupHL9xJV0VMyxxX1ng+ZNiV1/FwN
	 wLVxo9XqKgoKu+jz8tl1VPwQdOM7befsvfBQRwiqWqB6SF1jWFSUUaFSF/caztjXm0
	 CYo2qjBBlhQE1Dn/B8lct+WB0adQxEnKTtRDMAnNKjsTi90xHu3OwJZKfeSb0KlCgn
	 +2kvd1bwiJojawGIzHfD6RSP+qDVJl9oOWSxfa2XhwqL956LuPxBN3k00YC8h3jSnJ
	 4EUYstP3PdldnEuvFF7Rt7z0dPjqisqUudkgddyN+JqmdNfSNOMib8xGMX9es/Kq1L
	 q/dkS+5SejV3A==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
Date: Sun,  8 Nov 2026 14:21:09 -0600
Message-ID: <179416929335.628393.9119755051249298133.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
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


On Thu, 08 Oct 2026 16:56:40 +0800, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.

Applied, thanks!

[1/1] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
      commit: 61478a88b0ffcecf0351a75bd7b880b0bbcfee6e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
