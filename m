Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386468;
	b=T2xQ3M13vQkYr4TVDe9PHqzt10HTuUoBxjQzEw0qiMiaG+1c3Uhe6Nuv+l+O/aUgI6sn
	 5EIL3LY5eTOTJK6iI7ak2b/S1rIdSPmiHO1NZFG2wjE3C5PKWYDJS9TFBrNSDi8s6FLla
	 TIVlerV2WcB+Jl5ytCF00E4jAI1nFidX3qDf8s4b9GHpNwyaqpjvu14GggYlRBq2o9xe5
	 Pr0fsO9vR79KKPzYGXa4ttXhw1EHduF660xEgqQaEHHuRx9KUPBPlA0IRta+xroEWP7vS
	 NM/1m6JjlA0E3oxSE0Rh9N0Rcx0GzWwPNMvG/bVpP1aEYLLTXy/w38YdSLnecyH85mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386468;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=R4Zcw3rubr2XGwn0yn+KJncXn3gFJBg/JleZNOkAzL0=;
	b=JRc1heHqM3xzVNSw0BhgJWpsW1BwbNXeGtRsjj7UwCAemAVHKtUsDEHbHYLuFxL2M2aV
	 GB3PSESwJEgRlW2NNTMQaHnSYRD9Dkb/51lYk/9RhDbymIz3Ic3s7SyQlszDTRXm0pa7J
	 vzES+U0MiN2Cm7IGOMlt78siMQK4G8fheyI9Xhx4Ty18uXdZBk9VwLT63SgEnbgm9Jcrm
	 jZUMpeO/SNPCJ7at3lLjqKGOQrYdK1sz1RzZWC22Mzunsms2bIsVfuN0avML+cVowojV6
	 VTz6Q9lcjttcJ44vu8AdiBymVG2OGvmVNpn1J46Y8iw8FyD5mscm3Umwxs1xHijKcjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FSNczDvI;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A58606A31C;
	Wed, 11 Nov 2026 08:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FSNczDvI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=R4Zcw3rubr2XGwn0yn+KJncXn3gFJBg/JleZNOkAzL0=; b=F
	SNczDvInthMa8GMeOzpcWCrIQgGc1o3QDUs6CYvX3AvKDxIkhJN8E2Ni2MGcxBmY
	CcEqltvzK2Rk8VgGVjUZrXFtKKjIqcM781hA4HZFSq0q0ldDgpdRtsrKvZhDMWBo
	0oubOP+O1FPX/GMe0FL9irabMvlgU87qjeBRb5GyqA=
Date: Wed, 11 Nov 2026 16:40:48 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:  WARNING in usb_submit_urb from gl861_ctrl_msg on v7.3-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBv+TuUwv7iOaZOkdmEsTju82UcS4ufQl245Xc8EEuS7f5iUqRlhADGXE8O6qGhC3lDKJfD1fz9lHWIZJJS7IyAf3ye3y+4E++1FgdQ==
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
Message-ID: <1f7be7.73a0.1a1c9c44fc8.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgDnZ3MQKvRqe6lrAA--.476W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3RBmGGr0KhBAvwAA3o
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCnN5emJvdCByZXBvcnRlZCAiV0FSTklORyBpbiBnbDg2MV9jdHJsX21zZy91c2Jfc3Vi
bWl0X3VyYiIgb24gTGludXggNi4xLiBUaGUgc2FtZSBmYWlsdXJlIGlzIHN0aWxsCnJlcHJvZHVj
aWJsZSBvbiB2Ny4zLXJjMiB3aXRoIHRoZSBhZGFwdGVkIHJlcHJvZHVjZXIgZGVzY3JpYmVkIGJl
bG93LgoKClRoZSByZXByb2R1Y2VyIGNvbm5lY3RzIGFuIGVtdWxhdGVkIEdMODYxIERWQiBVU0Ig
ZGV2aWNlIG92ZXIgcmF3LWdhZGdldC4gRHVyaW5nIHByb2JlLCB0aGUgZHZiLXVzYiBpMmMgYWRh
cHRlciBpcyByZWdpc3RlcmVkIG9ubHkgZm9yIGEgc2hvcnQgd2luZG93OyB0aGUgYWRhcHRlZCBD
IHJlcHJvZHVjZXIgc3RhcnRzIGEgY29uY3VycmVudCBwb2xsZXIgYmVmb3JlIHRoZSBVU0IgY29u
bmVjdCwgc2NhbnMgdGhlIGkyYyBtaW5vcnMsIGFuZCBpc3N1ZXMgYSB6ZXJvLWxlbmd0aCBJMkNf
UkRXUiByZWFkIHRocm91Z2ggdGhlIGRyaXZlci4gVGhlIFVTQiBkZXNjcmlwdG9ycyBhbmQgaW9j
dGwgcGF5bG9hZCBhcmUgdW5jaGFuZ2VkLCBhbmQgbm8gZmF1bHQgaW5qZWN0aW9uIGlzIHVzZWQu
CgoKVGhlIHRhcmdldCBjb25zb2xlIHJlcG9ydHMgYSBXQVJOSU5HIGF0IGRyaXZlcnMvdXNiL2Nv
cmUvdXJiLmM6NDExIGluIHVzYl9zdWJtaXRfdXJiLCByZWFjaGVkIGZyb20gZ2w4NjFfY3RybF9t
c2cgYW5kIGdsODYxX2kyY19tYXN0ZXJfeGZlciB0aHJvdWdoIHRoZSBpMmMtZGV2IGlvY3RsIHBh
dGguCgoKVGhlIHdhcm5pbmcgaXMgcmFpc2VkIHdoaWxlIHRoZSBkcml2ZXIgc3VibWl0cyB0aGUg
emVyby1sZW5ndGggY29udHJvbCBVUkIuIFRoZSBhdmFpbGFibGUgY29uc29sZSBkb2VzIG5vdCBl
c3RhYmxpc2ggd2hpY2ggVVJCIGludmFyaWFudCBpcyB2aW9sYXRlZC4KCgpUaGlzIGlzIGEgZm9s
bG93LXVwIGZvciB0aGUgZXhpc3Rpbmcgc3l6Ym90IHJlcG9ydCBodHRwczovL3N5emthbGxlci5h
cHBzcG90LmNvbS9idWc/ZXh0aWQ9N2UyMjU1M2QzYjRmN2EzZTI3NDIsIG5vdCBhCmJpc2VjdGVk
IHJvb3QgY2F1c2UuIFRoZSB0YXJnZXQgcmVwb3J0IHNoYXJlcwo4IGtleSBmcmFtZXMgd2l0aCB0
aGUgc291cmNlIGNyYXNoIHJlcG9ydC4KCgpSZXByb2R1Y2VyOgrCoCBDIHJlcHJvZHVjZXI6IGh0
dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9KZEZMNjJMTAoKCmNvbnNvbGUgb3V0cHV0OiBodHRwczov
L3Bhc3RlYmluLmNvbS9yYXcvQjIzZUtGQjIKa2VybmVsIGNvbmZpZzogaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20vdGV4dD90YWc9S2VybmVsQ29uZmlnJng9NmE1Y2JkMjY4NDA2YmY0MwoK
Cktlcm5lbDoKwqAgSEVBRCBjb21taXQ6IGRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAw
NzZjNTYxNTcKwqAgZ2l0IHRyZWU6IGxpbnV4LXN0YWJsZQrCoCBrZXJuZWwgdmVyc2lvbjogNy4z
LjAtcmMyCsKgIHRlc3RlZCB0YWc6IHY3LjMtcmMyCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQg
bW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKVGhhbmtzLgoK
