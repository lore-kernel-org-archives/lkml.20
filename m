Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399305;
	b=yaa9LLYJTkpUrfybOy11FRaE39c4YHtKOA7LiM+6+GgarKy/HAIO1sdsZP2OSCJB4wSa
	 BknGN+JBVIJqvoz1xEbG4DKbI4ubk5K7u824Dd29VLhfPOiKf5spXbV02/impUvGQZoKk
	 DRnBsRXxc7213ugkC3BcK+Tl8Yvifn/Pj+l8SVnuGSHvbnUOoJx5Q2QifkrEsWH/cWjqp
	 lucokEZcyI912w7cOAvHQgrreDDzc7iwOD29eAI+T0n0ZsoN3M68r2+EigrBYxWmrYelS
	 ZE5rrw0uU93tHqqJSZutPnbdVuJUMnZquRjoSz9n3giTPGSq7CvaH2YN5UWBRuy59iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399305;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JWfkyhHpPTW5ODMzl2UFinUGGw1EY62cr6e/prnGWSs=;
	b=k1+PmxKuBM5JNxNJYTv4hE+heTcVOrpd3VuKY8YXvqyQDsdZC6ZkN2O2Be3D0i8Foe0N
	 3oaEtPeoi+fbpfF3ynotxed9kRP7oQqJjKvpe1rTpfjc5QdTeQbvUG6pHGfm3hAZMmNtE
	 VLPnphCaoVDxcIjlXuYf8ltIZC00rK8vV3Ngb1935tJItpMtWRL1ImbnjNetGmNccEiUC
	 ndo/P5+gfV7fDliIR4li2idMHoeoK8yBo1liCLFuy402PsvGaOjF+kkBZudeGFcToD+I5
	 CEVo+GT0Tch6n4iNnvET1ShTffI+E1WenBlgKChWfN5JQDMSg8NR+5gzR2XpI1RyuKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2+GhZTD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271B606A8BD;
	Wed, 11 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2+GhZTD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399305;
	b=sPQ0DyMlhEsqs8szQqLfzCKGmnrXC/VTauWJGBAGILzsArTwaG0fPg2qe3R2bm9yt8lZ
	 RSZb0C33sTCyf/DIb83NEnj3lt38+PJ7LPL9+UvYAKCl1Zuy9r+XHrHfUzWnI9cblDSgL
	 FTm3uZSrWhcYLxbtZXgrzuaCm0QxIxO7hgiAU+/CbxqK/C4WDxmvf9kSBV/gI5D4OsUTy
	 DBpQNnSIshn6oqiFdbqKC7GBYpUqOm0NKsu9t5y5hvzAvuTZGp43B6WuxIFYJyfyx6qPG
	 BuzaKrPLQa1oAEgBIp9thpDAVHjYiMXNECXFoMBikLrF2pCDeHiUEWD09Zk3W4ARbhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399305;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JWfkyhHpPTW5ODMzl2UFinUGGw1EY62cr6e/prnGWSs=;
	b=uqFSoEx51XflqDIYeY/3mqW7HNsy0lzDz3+Y5m9K5C3DW2BYqUwqQ2dkzJHXPcvK6sFw
	 Sadl4S/a+etBG5JjmlEWauCULW4Pgs2OKy9TdJF8rJiIi49iVngAJvkwyBCc/qHQXnCGr
	 Ux+U5LqqUNhNzKsxgoKzqXQRU2OTNTIR7BDIUipvix3cJRtFKb2zXM36kW+wrRUbaG9JT
	 qiZB/sxUW+auwCDLvk0uJAn7Er36+ibFE7sR7wTbHvH/N72U8MmxNlMcNsRxwLnKar8R6
	 eC1mPuKuZBQqEhfrO2n6ohCnF4iaZ2yE46bJX4nXbz2v1paBWPR5Zm+xmWbOM2BPdFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B30F1F00A07;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399305;
	bh=JWfkyhHpPTW5ODMzl2UFinUGGw1EY62cr6e/prnGWSs=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=d2+GhZTD0fAugDIfukcJcrWVvamfprc+827RWDS+ieMhAXf43ltAKY/8GMUtu8I0E
	 VUDhMX5z5SxdbWF0lBBuvOBLvtkWMnoNdvo8PFyfR8ovCLdeMbLxvxYcENfoN4EMLJ
	 xhAWHu3sZPRzqDZCq5KAtxokW9hPM+fDBipnjGmo8FfHcziYryz4vjE49JRX/SFzpL
	 6LeDOotGWaTHRzPl3/avANDa21nUwlEX05quU/ecMkWtSBZAyLTp68MIjPtULhOMHl
	 5rIujs3RAl/EdeY2av/zeQ804ayNtJgdxSDllVKgCz0m4zvERFJdtBFDKmZ+ghEpyJ
	 OBaedxKZ8+YxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B9A048F8E;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com, robh@kernel.org
Subject: [PATCH v2 RESEND 0/1] Enable audio on UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=697; i=founder@crepuse.com;
 s=20261012; h=from:subject:message-id;
 bh=prh6HXem3h6+JFP/qvS34mf59BBbBWZZMrWI0bgKzRM=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrSK49on9Uw/vaZo7sM386Vi+vfLfznst+t+XVxut
 JtaRKtlx0QWBjEuBksxRZbZouzlh5pXXJs7ockOZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKn+vpqR4d32aRd1vFj/RlZ9NmfZLK3JGnjCQ+OqFsuDiTv7rjydMoWR4b19w4K
 K7rXaa+eGaqmdvG99jeuaU1/Ia3fu4nupN1/ZswIA
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

Enable the internal codec, I2S2 and onboard microphone route. The board
uses codec revision B; that driver support is already accepted in the
ASoC for-7.4 tree as commit 157f7cba77a9. It is a runtime dependency,
not a change to the existing codec binding.

Changes since v1:
- Normalize author/sender identity and preserve it in the patch body.
- Recheck ordinary and strict checkpatch in the actual Git repository.

Mizuno Miotsuki (1):
  arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER M10 V1.2

 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)


base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
-- 
2.56.0


