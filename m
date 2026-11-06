Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938317;
	b=Ly3CXNw0zMlUT4HePjtp3SXe1pHPfv1/6GnEiAwOEuu9JcwGtgjDG1EVKRxGFyeEkXN1
	 gCWkagvvry7jcsPEcyS8QPukJVj8YB5T1MN9/h95akg2jqYqfgxqxdu1BddMpuiq332/5
	 onJu+bek7vxfj6OHV+r0p5XJrZh2cn08rVuvgK5Gr1zNFFSbfdVoAOBHCWOpapXKkKxyB
	 B17Hx36nN99f9JfFqGTvdXpkCpCkPL6RLS2M6ghTDDLGYY4ySy1AbooFsGWOmmp/E5AFC
	 26o1lTd5EpYGVf84M6pv8RvULQQrmZD2mOHQjMLPfPgpYofGARKnl/YOlRY9nXtQgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938317;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dy+6W3dhUjW+vdHYi6MZ5rHw2N/o7H/3Oheai7WIFWA=;
	b=Y2jRZOINiqaWIBtuCNVIx58SqS8WX9sUbCjbUX2lE5STvchp69b6xuL+AEbvWAUbQ1OO
	 UUmq1BmP7Zo7uCJL7OHBufnGN/AvzpePmeaH0c4amLyZ7vlb94eaYvv6+KDXACDjSSZnY
	 +TUQ6C9HQWdtjcAaV86z/xBxPnGIi7X1S1YDcP2SNkiD5Klgqy464RLkVtV4EAmWpZD30
	 0ftwP4/g3pZ/nDKGEdR7RVaPQrs2Y+OJGQvi/sI7GE4JRsxjeo8c4/jNpcJX3aTqbW7oR
	 enRLjaTwRWuxXOd6qvK/2nSqIxFYA/ERcRR/ntxfn0HWSFJy360EcgfrL1TjchF07wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="QFeftPX/";
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB741606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB741606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QFeftPX/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793938314; x=1794197514;
	bh=dy+6W3dhUjW+vdHYi6MZ5rHw2N/o7H/3Oheai7WIFWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QFeftPX/l+4YFzEwk1n2K6tt9NqpXrFSauKBIYlomoBgRBklgKjYJttpHYFgfajmH
	 Uh29tm6sNqQKbkiAEA4QwSQmcXVpBymw3Phao92cQBCgtLrwsMkSK9ugqEx6/RQZW6
	 6W0cNMa7i57IGCZagYsETBEob3XMxTC4yqc4WFtUhCIfbAmv6Ms8+3xLb7IFPonioI
	 FHLvyo3BjV2vZWgNXg1Er/cxF9nzEBguxJAJ1XxNdBL8r30IeHxRH3QH66hTGISCVu
	 0ck0k68Ttmj+4SXk3heGDaBL2ELyPIMLk7LGPp8xPSYCyfW7tiU86AtOI9brP08BX9
	 tYeM20YwfqIkg==
Date: Fri, 06 Nov 2026 04:11:48 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20261106041116.78937-4-lsa.uz@pm.me>
In-Reply-To: <20261106041116.78937-1-lsa.uz@pm.me>
References: <20261106041116.78937-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 8899de5a8329939039e6e2530309d37221b2eb38
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
a Sony IMX681 as its user-facing sensor, enumerated as ACPI device
SONY0681. Add it so ipu_bridge_connect_sensors() builds its half of the
graph; without the entry the sensor is never connected, whatever driver is
present.

One link frequency, 969.6 MHz, on two CSI-2 lanes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..2759c776cfc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


