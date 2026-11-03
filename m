Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695090;
	b=Tqv2eN2M5QVonMV4ugHvF7k19FWnq5GMafZ2/tLCfXztGnMd0v5hMfIy7K7Ju3pdNX0v
	 rjoYWmtmiEKRkjLFilNnPboNpwpgcphMmwqkE2PukoTCS1mZ1WvSac79+baglY/XP/tXh
	 n1yjXyrHpabqZYfM+duHYF6wxS8csaEMKjD8lAOtFM55nYwqW73ZCBRUagXfEQbPF4N6w
	 ypcLLqzeSzcF3++kWMma5VG1bPBVLQ3TqaxQOvAKdafJjicY6c4RKO5VR7U8ZDVvhXcjj
	 ObmyDCOR/pFmdo6iYBTp2Dt1y3Ms7YA/NTuU2YHuJTIC+ypbekQvghS+8ImfE63WIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695090;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	b=ZKlVnNqLviKGEEik17S0K1Ag9cqGyvSFHlPBSnVaThZRi25KsWMluICMCpfNVt7WDOpV
	 SuWjOeu9QGXTWALoLpcFZzYY2hAKBk5AJUabNzAka8bURlNsfNfpqtAdvVbt3Ule4XlOX
	 Japfh/DjA9bmEBR1OpOEKLyQjRjeLBwozcj2geU4Ik1yw1Z5QQAcAOcHdcFNFZr11PgOD
	 DMQf3OgB1RvIniMW9npJrASvJ+ZiHLUgVZ8HToZml2pxQif4BcKdvY57rmqZvY/esOIYW
	 ZQcyzTSMg1fnDwgLsxCuRopzGOZ0wU+Aaxj+nXHPVycUPjghxZHNc/WpSm961JdDzSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kuGQ+OYV;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6434606A96D;
	Tue,  3 Nov 2026 08:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6434606A96D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=kuGQ+OYV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793695045;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kuGQ+OYVYZYKS/yecfpVmiR8QUZOJs3BniCprObj3Tbq3v/66xMTpS2GNZDnpw9/R
	 0+l53KHroxswqBp5praQbmbWxUmYDQlM3+4anV541sBPhy5QlRBx2rPMCpU5WjcISh
	 /RfuxhlS2CbH2SMy8QTk8DcZyNiqE0caA2qC6VRE=
X-QQ-mid: zesmtpgz7t1793695044t51b83d38
X-QQ-Originating-IP: MqKM/sJkuvDY17zuAK1CItbTzJpswIk3WyxUZSB12UA=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 16:37:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2555415276138771105
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 03 Nov 2026 08:36:50 +0000
Subject: [PATCH 5/5] MAINTAINERS: Add entry for SpacemiT timer
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
Message-Id: <20261103-spacemit-soc-timer-v1-5-36722421db6e@linux.spacemit.com>
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkv5yr3pDuqGN7hk550Kajk6Iynx+UOXk10yC3xFuL/9
 rTBf4dSRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwES87zP89+oymXkx5N66JA1e
 Q567JXZHe67Y7/m/gC1i1RqH6yosgowM/8x8b/6Z8t5P7Hqccf3q289CLrGeNPvdaWuW1ui8Oje
 BCwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbGAPuuY7aUIQbOFRQnfzKgpf0YNY30SZZn732AElhYAcRo2NN2Z0OET
	vptVEaN4QWcANE0zRqpzIo1BkkIkUufbEpf9juamQpT3/SH+8CpbwujbXlgw5+6CyDhnbx7
	RrDT9M8mFR/KccP5cE3EaKE7zD0cMWj/fhTY6Febe74ZO6Iejz8H3e3oAinSTp7Re30VbEl
	oj/Sp6j/ZqP99uW4zMvl7tiGyEswwXKrnmOKYvfCtzz3jGhuDbSYXPtgqbLlFphG2WH6j8j
	43+b7V0ZHqa0rZ6410fkVRDn6QDhbO46RYk06+2TCePFjouo0DvxF6JJtoOfPL7zxdfBKAT
	nbs8T8ZQOnOotyPshIRG51lgxL8gTuiE6su7pWWx+iyVuux7PDVDIaDV7OI2ge4T8KAXaru
	MkhqxlQpWKNwnGgKUcF7VqBxCEKx2Fmoi5H+avKLKUysm/EErNpY2MqaxtjXb5adZYxvIai
	KxQ/rOh389XX3S9O30gFaXIg18AQJcE/jG1FyWepmNkpAi+qrrh7iEmqOFW2efs/Vnsl4RE
	+G3Cqane2FFENc2gsWFC0f4CnGtddS1riJTASBVXfg1EqNJmrUyFWp6VM6qMn1zakXU9hAk
	axgd97i+wtIbRubOynb6zigeUNa394shd3OZTYnVVv7on0UMGuTtguSpc+gxjQNYXdRr847
	gS2gKx7BtuONbeaCaWNsNV2igt/C3Muy7X8SY/T3sOC5CdWmypIC/9meQYALC0DRl/3qeDD
	bFQtfXE04SvNbp8fR4ZkSauV8CRrli7fIzGKD4ZgiDu+D3PacblSUENk6p3JiOMSByocImu
	9oMg6yOurMYWEDIjl4FNFZ7389CL9B5rpjs7yqmi64KMJPY0TBdXsbA0YsIxLvmmkqFAS2V
	LEmd8GQ/gluGBSNB1giOHgj4CXpkJGniR11LLIXTNtWqJzH8uGF1OOmMKXCgMTNlQMQM0XD
	6MlzmoohgQ+5EAwQoNZxiN0mMMysx7gzaDgOvaibVI2zBWHqhwLK2g6TO1CRc3XTzSzivxO
	EJByhIDTkCyj9RTvJCIgIRIMS9pQQR4dkCw9Ej/gpAeCECHqj3iOecl0GacEQLcZjl81WZT
	1jlMxjB/ByXHlQcW/mC1Q6cIlHa9SXE934nSYdyiUXEy62WSMKDsFqafEk+1YsW6OADOmrO
	Ztz6eMD/nl4p0ErS9l5Ylt8nsA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0

