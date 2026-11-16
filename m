Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823494;
	b=mhxqlzs2PU6912vfBXd5YYH3e520F79yWycXw9Cb6eoveXzqU/CzVWd/CSfbXr2FB85P
	 iGx6RncqsiJUF3UqOcM/95non3677d0GdhmWmER5VaPVD5IWjGyY/Bgj5fxoJ47XT5GjA
	 lG+xaak0y+L+RlkHLYaleaTrNTeU68Q90Qw9RwhVkrjJdvo2Xejznv6slBDlS4dXDFpH5
	 OaYa2eyCoVRx6IAGMHL05uPoKztPkeHumMAoFF7xHTNNPO2EdkRQrY7mrIniDiaf51v67
	 Z5ryvc40arCqwixk1fbrS12DOr4JtkV2SruWChddlFkAdR7DfQjxB3jcNRgC3QJozWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823494;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=nWbqV/2GgvrCv1bHqZ+LVKd/sYtL0RqidrX2JSrXj94=;
	b=oAawlL0aX7kcQhUjECZWSae9FdgA5m6gR06YuOXNcuvT+RhBTXrX4g12kD2snm8ljJqZ
	 cVy6VlATuvW8lYbOODlQLSqNTnbpOFJJdXfwo1jraXLLhjMRd08g7JBA5er0jsSxp1bCd
	 q7HR46ByyBd/+/OLR+932PBXS4Wu661e1Oqy/w8Cw40rFrtDPP8wDKlrj1LHKL7cLkklI
	 89PwTXM0h49ctRPABtWFOGIt78QcLSOCb68lvYdx34M6g5D8O6E907Oq6pjTxeeRNCaeK
	 no0mFNUDJBF2fyoWv8hPoufnYzdQBXzrVo7YjTiUOjQ843wFbpTFqK5OQyGNVOyT30w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmGCEJUf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F7606A32F;
	Mon, 16 Nov 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmGCEJUf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36011F000C5;
	Mon, 16 Nov 2026 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823493;
	bh=nWbqV/2GgvrCv1bHqZ+LVKd/sYtL0RqidrX2JSrXj94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SmGCEJUfFitU+d0elvKkqVrw54HlBbcB29j78bP0CsUwsAbWRPluoXK30w+hamf1Z
	 02iKBkoP1WFXp1jrAkpJzv4jLBiLuaArvLeoKfbySw2ab9PG6uFjPCwc5Rmhn21Eyq
	 sDctT6Ct086veH0ivfHZSjabY7totIx8CNqZr/IXMR0SRWZex9lqDFQTfpqr3+Axkc
	 7+fbaM/FJYJpvx5jH802a3RoZdU6SOU9+fQCDdVDmpn+ToYavESLd4RsuU8TdEkvpJ
	 hgbB911M+qmNDO4+x4xpOHuPqEm+WgGRIP+zWX8Vpe42SfuMPTW1ZdUIZ7hHMpVPdk
	 aquj6h/KexujQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>, 
 Chenna Kesava Raju <chennak@qti.qualcomm.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session
 creation
Message-Id: <179482349066.14925.18435181444934097603.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 10:04:50 +0000
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 14:01:01 +0530, Vinayak Katoch wrote:
> For ADSP, only a limited number of FastRPC context banks (CBs) are
> available. Each CB supports a single session, which means only a few
> processes can run on ADSP simultaneously. If all sessions are consumed
> by fastrpc daemons, no session remains available when a user application
> starts, causing the application to fail.
> 
> To work around this, some DT set:
>   qcom,nsessions = <5>;
> which duplicated sessions inline during context bank initialisation.
> Upstream feedback indicated that this policy does not belong in DT and
> should be handled at the driver level instead.
> 
> [...]

Applied, thanks!

[1/3] misc: fastrpc: iterate CB nodes manually instead of of_platform_populate
      commit: 81b3908cf7b9b19a8a47521a18281399c55db889
[2/3] misc: fastrpc: move ADSP duplicate session creation to the driver
      commit: 112dc91edd51e964351513d876c2e5a63cbe980a
[3/3] dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions
      commit: 641dd7dd0f68dacb8e972aded126887c17d6cf37

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

