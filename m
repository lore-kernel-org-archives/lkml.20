Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416943254B0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369875; cv=none; b=lgzcwnZCNQd6NPGezrbzyR/oB3A2rbYCUEbHMr4p/0DJGl/TztGKMv/g2baGNc4G7YceZnfYcbYmz0e1f0T7XohasENX7JpYgTmjWnRpkdNt8Si5H6GwsGEFOJnUnLcnu7Sy/+k74Pq85MbI7uXNqW/FLQT6X5Y5U2Dcj+qIw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369875; c=relaxed/simple;
	bh=MdiTlf7uzI6N0Ni3wzhT7ObY+B1VrQsv7PP9X1j0apo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mz7TCXnMLYiy/t8aolga3u0fdyxnmUiEnVz7h3RzHdxPOVm9E8NkyZieBQ2CSewS9yTBnXZgm7zDTybepUsGmxgCUgSmD8EvpgMASmzBW1D4BA5OEkH7G6Zg9MZbnbWtKwWm6nsV3JUo4qtc6NPj8LIci5tE7bvPaOQOdJKUOuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=HiKrICiB; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="HiKrICiB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1789369874; x=1820905874;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MdiTlf7uzI6N0Ni3wzhT7ObY+B1VrQsv7PP9X1j0apo=;
  b=HiKrICiBltcW7YqyHqxfYQ7gVCPqkj8rODtgMW+MbbmRNlrp+2BrE6K6
   UG0u2jznNXxsC865kKy23j+WwuNILVyLZE6gWE5WykrHawVnA2mQVjRjz
   01qkeDV/GmHni3bXGaghYAxKEXuI8U0mkLwntUZlQ1z65RaeRmo+tNbhp
   o=;
X-CSE-ConnectionGUID: 0csU0Qx9QGCg+On3F/JFTQ==
X-CSE-MsgGUID: mKxy7xgnQ6eIwksf4gi+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="178531538"
X-IronPort-AV: E=Sophos;i="6.27,102,1787004000"; 
   d="scan'208";a="178531538"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:11:05 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 09:11:04 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 09:11:04 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Mon, 14 Sep 2026 09:11:04 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
	<alex@sverdlin.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Topic: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Index: AQHdRASdQI/rAfbWgkienan9hYKZEbbNfGoAgAAmnTA=
Date: Mon, 14 Sep 2026 07:11:04 +0000
Message-ID: <fb4398e88939472eaa86cdc098a3d265@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
In-Reply-To: <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTWljaGFlbCwNCg0KPiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDY6NTAgQU0gQ0VTVCwgVGFr
YWhpcm8gS3V3YW5vIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiBGcm9tOiBUYWthaGlybyBLdXdh
bm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQo+ID4NCj4gPiBzMjVmczI1NnMxIGhh
cyBpbmNvcnJlY3QgU0ZEUCBlbnRyaWVzLCBsaWtlIHMyNWZzNTEycyBhbmQgczI1ZnMxMjhzMS4N
Cj4gPiBBc3NpZ24gdGhlIGNvbW1vbiBzMjVmc19zX25vcl9maXh1cHMgdG8gczI1ZnMyNTZzMSB0
byBmaXggaXRzIHBhZ2Ugc2l6ZQ0KPiA+IGFuZCBzZWN0b3IgbWFwLg0KPiANCj4gRG8geW91IGhh
dmUgYW4gU0ZEUCBkdW1wIGJ5IGNoYW5jZT8gSSBoYXZlbid0IGZvdW5kIG9uZSBvbiB0aGUgbGlz
dA0KPiBmb3IgdGhpcyBmbGFzaC4NCj4gDQoNClllcywgYnV0IHBhcmFtIHRhYmxlcyBhcmUgbG9j
YXRlZCBiZXlvbmQgUEFHRV9TSVpFKDEwMDBoKS4uLg0KDQp6eW5xPiBjYXQgL3N5cy9idXMvc3Bp
L2RldmljZXMvc3BpMC4wL3NwaS1ub3IvcGFydG5hbWUNCnMyNWZzMjU2czENCg0KenlucT4gY2F0
IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTAuMC9zcGktbm9yL2plZGVjX2lkDQowMTAyMTk0ZDAx
ODENCg0KenlucT4gY2F0IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTAuMC9zcGktbm9yL21hbnVm
YWN0dXJlcg0Kc3BhbnNpb24NCg0KenlucT4gaGV4ZHVtcCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkwLjAvc3BpLW5vci9zZmRwDQowMDAwMDAwIDQ2NTMgNTA0NCAwMTA2IGZmMDUgMDAwMCAwOTAx
IDEwOTAgZmYwMA0KMDAwMDAxMCAwNTAwIDEwMDEgMTA5MCBmZjAwIDA2MDAgMTAwMSAxMDkwIGZm
MDANCjAwMDAwMjAgMDA4MSAxYTAxIDEwZDggZmYwMCAwMDg0IDAyMDEgMTBkMCBmZjAwDQowMDAw
MDMwIDAxMDEgNTAwMSAxMDAwIDAxMDAgZmZmZiBmZmZmIGZmZmYgZmZmZg0KMDAwMDA0MCBmZmZm
IGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYNCioNCjAwMDEwMDANCg0KVGhhbmtz
LA0KVGFrYWhpcm8NCg0K
