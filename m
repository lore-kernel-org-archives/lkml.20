Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058849B1FE;
	Tue,  1 Sep 2026 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286873; cv=none; b=CiPimx2K4UDBJWZFQ339IIXiLVwDUWyilUfSxTrOQHGQi9/IElJzkuzJw2h08Pbcn/KGZshxjSVjPZRx12EBmi402V0IdxN4IVnSfDgRBJBsXY/+WN42KcIJ/mvu2GLOuAPkTcy3HCMSUU2vlkbohfN9JVfXpu4oOTR8lWFZwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286873; c=relaxed/simple;
	bh=HMmlhE3+BPG/G9PQrCoGeemgq7V+HKNtcIHtCkFxQQQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dYpwlpUS+Z3Z4VA4E1hOjzqEqSU2r9KYDOU0W36mInsMNhZeagrSgUd2axhHOKA0NuyiDCAfwbr5G+JiOa8CpBwXBQvrIyiiJG6+3u/DbRCcpT8f8CsCVJ8VhBS6VDgiLUCZTKFnTGfHHLsID0JbOCdRYIpjT0gV6VdBiF0zLDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9LVe9e6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9LVe9e6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE651F000E9;
	Tue,  1 Sep 2026 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286871;
	bh=8ayIURP7vBNNLqMVNJruSZU3B6VCLfC9ekOu82f3FSE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V9LVe9e6FlT7QfwQ5+c3fDQrKm0ip1gXtBFAOemHM/A/WClhdFztCChgtui94CV+n
	 M0g+0z+q5BZLzKwel4FZ6HwQaVpLNaAmCIoIp5BbXVrYflrjBTJv8V7QvvRekWE8dK
	 /PIFaVfhXVEIcei9YU9UYNfXOrmIKv5/HyaNR18/evNom/PV3VFR2PjsvhlEhXfUrs
	 6Y54o3ratGsXOM+GVT7qMx7RKRvNmkNyRnpXTcAXeHiXmtyR8xSirCIZN7HVgYP69z
	 mE32Lrb5nflVGWnQkqiWwQ+YoDTrBp5ZM5j2lLQTPbULg3hv42rnfpR/5uLLiU2+1g
	 OFQLXFBhe8IGw==
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260811091703.685487-1-egbostina@gmail.com>
References: <20260811091703.685487-1-egbostina@gmail.com>
Subject: Re: [PATCH] dt-bindings: sound: Convert TI DA830 EVM audio to DT
 schema
Message-Id: <178812820078.13461.14863204644144903133.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:16:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HMmlhE3+BPG/G9PQrCoGeemgq7V+HKNtcIHtCkFxQQQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxeSHDt2SeW/O4/HVJrUxZAvFnJyL85dvqkPj
 o+haLTnvP+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXkgAKCRAk1otyXVSH
 0OPsB/44xDQpWGecG0egucraGDfRyC1ddqJiAUtWD4kUyLotyO+ImRri+PGH5Nzc3P4HOVxj1FS
 xTcG4YrlsnzfdKDI440L5QNL1aW9EbvWl8+NCwJuIKXkDvn2dxRRfXh9inOi/gk5du+2ZpA3SoF
 XA7OzAiQO2dZkcQTYL+/weQ6PlgemrZtYn1ffFLVjeXIKbSkOYUv5g6w3FOFshL7voZjKl53pul
 N6t29WY3gdOV/7XeCxmAogsYNzJQipomlOXNkxWQeQs3tAy2kvDSJIC39QUqjbxKeVo0nHw159P
 qrMC31RiZihVE9Fz0oJ1NEToHPyo1GQstekCSaG/a85L5ISO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 09:17:03 +0000, Eduard Bostina wrote:
> dt-bindings: sound: Convert TI DA830 EVM audio to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] dt-bindings: sound: Convert TI DA830 EVM audio to DT schema
      https://git.kernel.org/broonie/sound/c/b0ac345bad82

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

