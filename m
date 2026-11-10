Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292699;
	b=vsPgwyoepQULKgreCaVc8OOmn+sPBW/EeuHL6/JNmSzjKSlm043JUpgDM5rkYydbCvko
	 VHdWifxjrdw5h4Mw8jJFLnKTnRz/RV+mRXbGMayQBzjDcg5ecFm0B0lDLFquqlDtq59/j
	 ZikdKR+2rU+CeGVA5evk+z/75H5005aqDHJxtJyGDUHwksM8KlBJ4ro6+lVpYkhK8xMIM
	 D6YYQE7DWM8P2eEwBgeeZ4wzDl/A6KomZrc5dS1dZpnFOQFgFmsskXoUELv4/bhTku2Rx
	 Cs4AfKXj0jb0oFmWv25eJb0Iv3jKR3d3V/yN7KeIqEOAi9Tth4NfaJ0tmjYAnCfFEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292699;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=AgZ33A74N/3OfXAQhYF/jw8rO65lJKDN5faIKmJr/6U=;
	b=e+obhwKX+lCzD+kN9wZKt1V6PYpYDDz1tZdxqjvveSiLP/kDnhnwusfdKxgD731+ee/K
	 m/SNvP+4aalGQUTHkHsIA87Q4aff3EZmKIJkGrg3sG/IR6ceNCKgaSQaBAAF08XXfd9qS
	 yBAKdNqto4b0o87ad1ACFrtYs8lyO5M9y7q1J1749Pb76XGbWs+R+ft0jenGXBTdhikmF
	 k/qlKbsnfiv4f+Pq11JLEELxLDt2Cv06t0NItBVaztcztL6McW/AHvNLe9g2uUv3DTthc
	 /kKSGYMp2IslzqS+cei7oQofRi2GmOE/rQsJv3ZEaoJPEpFY47xydBumptNwA9MOg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jEBWeG4G;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74E606A32A;
	Tue, 10 Nov 2026 06:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C74E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jEBWeG4G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=AgZ33A74N/3OfXAQhYF/jw8rO65lJKDN5faIKmJr/6U=; b=j
	EBWeG4G8etrjgTGMxOv4qJcQEMF4gblKfKqqxzdKTk2UrnO6GqarnbNJlmyNboPf
	oJoJ9RmNzn484d+QkhwJKzipXxBdtZlOeK+Qn0LwRTfD59SmkRK8qVmIR0DltOhu
	QLdpYjSNA3DwYjA3rSaZ/IL27oMzKmMNdkyOeYasN8=
Date: Tue, 10 Nov 2026 14:38:04 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: INFO: task hung in dvb_usb_i2c_exit on v7.3-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBv6SvU4j4iCcbOkdmEsTju82UcS4ufQl245Xc+0Gpx/uxxgFbWVuH1zqy+aKERKnoRu9TDlC8s9YbKt+Jo4R6qGU3mEF0NYYiQev8g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <182ccd7f.4ef9.1a1c42d951f.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kigvCgD3d4HMu_JqRRBrAA--.26W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3Qx5K2ryu8ysxgAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgaHVuZyB0YXNrIGluIGR2Yl91c2JfaTJjX2V4aXQuIEl0
IGlzIHN0aWxsIHJlcHJvZHVjaWJsZSBvbgpMaW51eCB2Ny4zLXJjMiAoSEVBRCBkZjI5MDgwOTBj
ZGEzNjhiMDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3KSB3aXRoIGEgc3l6a2FsbGVyIHJlcHJvZHVj
ZXIuCnN5emJvdCBvcmlnaW5hbGx5IHJlcG9ydGVkICJJTkZPOiB0YXNrIGh1bmcgaW4gZHZiX3Vz
Yl9pMmNfZXhpdCIgb24gbGludXgtNi4xCihodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9i
dWc/ZXh0aWQ9MmUwMzA3YjEyMWQxODBmY2EwODEpLiBUaGUgdGFyZ2V0IGNvbnNvbGUgc2hvd3Mg
YSBtYXRjaGluZyBmYWlsdXJlIHNpZ25hdHVyZS4KCgpUaGUgcmVwcm9kdWNlciBwcm9iZXMgYW5k
IHRoZW4gdGVhcnMgZG93biBhIERWQiBVU0IgYWRhcHRlciwgcmVhY2hpbmcgZHZiX3VzYl9pMmNf
ZXhpdCB3aGlsZSB0aGUgaTJjIGFkYXB0ZXIgc3RpbGwgaGFzIG91dHN0YW5kaW5nIHdvcmsuCgoK
T24gdGhlIHRhcmdldCwgdGhlIGtlcm5lbCByZXBvcnRzOgrCoCBJTkZPOiB0YXNrIGt3b3JrZXIv
MToxOjQ0IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxNDIgc2Vjb25kcy4KCgpUaGUgZGlhZ25vc3Rp
YyBwYXRoIGlzIGkyY19kZWxfYWRhcHRlciAtPiBkdmJfdXNiX2kyY19leGl0IC0+IGR2Yl91c2Jf
ZGV2aWNlX2V4aXQgLT4gY3h1c2JfcHJvYmUuCkl0IHNoYXJlcyAxOSBrZXkgc3RhY2sgZnJhbWVz
IHdpdGggdGhlIG9yaWdpbmFsIGh1bmcgdGFzawpyZXBvcnQsIGluY2x1ZGluZyB3YWl0X2Zvcl9j
b21wbGV0aW9uLCBpMmNfZGVsX2FkYXB0ZXIsIGR2Yl91c2JfaTJjX2V4aXQsIGR2Yl91c2JfZGV2
aWNlX2V4aXQuCgoKVGhpcyBsb29rcyBsaWtlIHRoZSBpMmMgYWRhcHRlciB0ZWFyZG93biB3YWl0
aW5nIGZvciBhIGNvbXBsZXRpb24gdGhhdCB0aGUgZW11bGF0ZWQgZGV2aWNlIG5ldmVyIHNpZ25h
bHMuCgoKVGhpcyBpcyBhIGZvbGxvdy11cCBmb3IgYW4gZXhpc3Rpbmcgc3l6Ym90IHJlcG9ydCBh
bmQgZGVzY3JpYmVzIGFuCm9ic2VydmVkIGZhaWx1cmUsIG5vdCBhIGJpc2VjdGVkIHJvb3QgY2F1
c2UuCgoKUmVwcm9kdWNlcjoKwqAgc3l6IHJlcHJvZHVjZXI6CgpzeXpfb3Blbl9kZXYkdXNiZnMo
JigweDdmMDAwMDAwMDBjMCksIDB4MjAzLCAweDg0MDEpCnN5el91c2JfY29ubmVjdCgweDAsIDB4
MjQsICYoMHg3ZjAwMDAwMDAzODApPUFOWT1bQEFOWUJMT0I9IjEyMDEwMDAwNGI0MTQ2MDg2MDE2
MzIwOWVhODAwMTAyMDMwMTA5MDIxZTAwMDEwMDAwMDAwMDA5MDQiXSwgMHgwKQpzeXpfb3Blbl9k
ZXYkSTJDKCYoMHg3ZjAwMDAwMDAwMDApLCAweDAsIDB4NDAyKQpzeXpfb3Blbl9kZXYkSTJDKCYo
MHg3ZjAwMDAwMDAwMDApLCAweDEsIDB4NDAyKQpzeXpfb3Blbl9kZXYkSTJDKCYoMHg3ZjAwMDAw
MDAwMDApLCAweDIsIDB4NDAyKQpzeXpfb3Blbl9kZXYkSTJDKCYoMHg3ZjAwMDAwMDAwMDApLCAw
eDMsIDB4NDAyKQpzeXpfb3Blbl9kZXYkSTJDKCYoMHg3ZjAwMDAwMDAwMDApLCAweDQsIDB4NDAy
KQpzeXpfb3Blbl9kZXYkSTJDKCYoMHg3ZjAwMDAwMDAwMDApLCAweDUsIDB4NDAyKQpzeXpfb3Bl
bl9kZXYkSTJDKCYoMHg3ZjAwMDAwMDAwMDApLCAweDYsIDB4NDAyKQpzeXpfb3Blbl9kZXYkSTJD
KCYoMHg3ZjAwMDAwMDAwMDApLCAweDcsIDB4NDAyKQpicGYkTUFQX0NSRUFURSgweDAsIDB4MCwg
MHg1MCkKc2VuZG1zZyRubF9yb3V0ZV9zY2hlZCgweGZmZmZmZmZmZmZmZmZmZmYsIDB4MCwgMHg4
MDApCnNjaGVkX3NldHNjaGVkdWxlcigweDAsIDB4MiwgMHgwKQpzZW5kbXNnJG5sX2dlbmVyaWMo
MHhmZmZmZmZmZmZmZmZmZmZmLCAweDAsIDB4YzAwMCkKc2VuZG1zZyRORlRfQkFUQ0goMHhmZmZm
ZmZmZmZmZmZmZmZmLCAweDAsIDB4MCkKCgoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGVi
aW4uY29tL3Jhdy8xTGEyQk01ZQprZXJuZWwgY29uZmlnOiBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS90ZXh0P3RhZz1LZXJuZWxDb25maWcmeD02YTVjYmQyNjg0MDZiZjQzCgoKS2VybmVs
OgrCoCBIRUFEIGNvbW1pdDogZGYyOTA4MDkwY2RhMzY4YjAxZmY0MzcwOWY1MTg5MDA3NmM1NjE1
NwrCoCBnaXQgdHJlZTogbGludXgtc3RhYmxlCsKgIGtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzIK
wqAgdGVzdGVkIHRhZzogdjcuMy1yYzIKCgpMZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRl
dGFpbHMgb3IgdGVzdGluZy4KCgpUaGFua3MuCgo=
