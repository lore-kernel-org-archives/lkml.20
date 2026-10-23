Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750456;
	b=07s1cQgg9aaD0cplkuxePoAttMDmiXa+IbiQcB5Xz7iJTn6Fc76hhBqiW96Iq3z15BCU
	 CM/45R1TYLwxLLUWh5uaenoQCuIDS2PwYNEGZwMCcD7Yg4OcJs/BV6HvyNwXkWfEOxA8L
	 gAxYzohFfSF2XLl98pPvRmnoaHyYl4EwxO4L8pG3v1Poa+73W3XhQf3bC5SW6zYQ7kSD/
	 lNrlaphJX3aQsA4nJGOxVbaTNbn61vD+9/SoTLENfblgyuODgRQ6ow45vAlqGv6R70GV/
	 wiuwl0mJi48/BWMypobaEndK7dnbim+1PtMzkByHOHEQ5q7IW8OT/yrUvLMmocGFj/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
	b=bfyIWskRDgVpxnpOeacIM1FpWszF4TNMnLQclox15aT+rtk/SLW8qXng1L0BJdFqh8TJ
	 3aoow8cTg9l4rmr7Qg87EDU1dUy6iwPiDdIejyntPIJsCIUsQ33M7KHtjkepgN2P6VVSW
	 Fqt1uwrfyOuLrwj1NuVgrvVkqWMN0GlRVL37t1TE0DKg0YXY/spMGUVBeDWNYlQhnLlit
	 JoK/OO/io0QfPMpCTxnnswa7K4I8mriB/f29/3vmRMGyrWP/5a4Fg+fNGob43Tbzjh981
	 NOEivb/4b+JhrW5ta/+MxLkzoiLVAEB7ecP7nrDaz4oN5f7zlpIkDH3we0gf4az4eGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKWpjrfU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nghnq4Ei;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKWpjrfU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nghnq4Ei
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUIF3550605
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HAeWxfZTcHlKlNt7pgixx+
	1a1cs5BFavajxZrxnqPSU=; b=CKWpjrfU33uGEonVYMJy2m8zQoYRqjtB28+6Bj
	g+1KXTkF9M2PuBUL5aFsvI0pDLmtg3vgQU49/V8+QXimJjyn857YeRzv59i8pJkE
	mjJU7uWnhXy0YThoBbZqrpWZc/Ww/NZUnRnJphAhkNyYResyqVCitX9PxbYmJa9Y
	pZkky6Esoo/LHTUC3UMIEmuQdlsEXYMKuvrei9JVatBmC01d6YGINLv9TSwIEatZ
	p3O8hXl3dPE7OGeEhwDCjknZ4tBY7HPKO9zhwUH+i9rlBCMpdnp3/ntxD0rW7ZBu
	DmPGdqlUmVk8tADOMhNyYzRAeiTI4uWpSNP4KARUA3TlGPTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrb5pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso152780485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750453; x=1793355253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
        b=Nghnq4Eim8BXfzav67zzlUl1PlCoj6N/+OxEtEyTyhIJZHhpMZcpyKqbDanpltpuHT
         h0f1FNevNeGh5v1+mShP/ghsQy1Ckqj1vc23Q42EsOkVDs/6rMiD7hrvDKl2v3FcqEYf
         7MUDfjzIkJlg/DnFRa+1r8sPxjHRvk50wWFD1vxxov9S6LLwlAOChBRTxqIpMQxdOMT0
         /mzQGwgQOyakn5KmgIKm96XfAEEd1D3OFQ16Z2HCJHwUdNBKul2ss2BwwuGIWSgx7Xzf
         UO6kwh3SgMax2EHmhCh+aEP6Tga8K6XR1Zeygg4x8IB034DK3W+j58fQwJjSF145NGSm
         HP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750453; x=1793355253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
        b=E/FNhM5HLs9H7m1npP1vmlpye2NUqyWFMH0NJ3vH2N60j8O7DShnNzThCCHPSf6ud8
         DSn8umQFAbdtAPuK9XPYs+85bR4iNC0ggKnyncVFHsCmFWSoSBvQ0h2xiaA2nBbqAfg9
         P/SmAoNeCLrRyqZInsG1iAxJUEyqakzMpM7l5cfF01LlVDPhXvtrCfengNXBR00DMAle
         iZd/3nu2MYxAsPvWb2R9HKSwlu7gMoBx0TxWEu8tY/kHLTE7OPyydjJgA0HjVDMxK2Yp
         7XqkaT1pSt5KRA1dbA0ox0/vzFk5A2J9zpyQrV1S0TrVYmADRJbZXaIHKNwTfD7xMj70
         SSsg==
X-Forwarded-Encrypted: i=1; AKwUvBzjPlq/tmZPhDrzDHpZSt/ZtofqeTIUwnuqLT7yXV0xqs3YAxiqN/1G0hPk3H70kYkreprUyhr7L8f+TUo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQZY+ryOCitFdGaoPDxSjPkKQH59WT4DTuKjKzfceXiITOrolM
	34kEoJoWpu2w0mkaPj2ZldU4FFkquciz2fWD3+r6m/0XCe+IB16nD4ugSZqiyK7RCJ2imIPMx2x
	eY7yBDtLanwKH9jTpJvOjNIL0b2MXV1BbRvmfn/v5LfedUo4Oqvj7ag8HS7KG71DMBio=
X-Gm-Gg: AYBFou1xpFOFIZ4PNpwxHjHHLo8pv5sSvAJbi63pTtNjQE7karBHwLd4POBfTKzFeCF
	MbcWpOFIdjXGa1/nTQAwQvjcdZF/M2BzgAE9MrpOOWDv4THxHXk24fEFJuStwVhpAmpW85BalU5
	H0Nxuo2B+X/n+pV6dd2+jmKJZzrka303i7E+iMJFOLQLi9PeYoMC3o26y7Hdbk4kwwLB+fV+Pvj
	kLAuW28eIwQSkiWY1lIr3kHo65tr8DUnUJmkjgPJKAZFi2KjphQoxI9IOvfX2RUr8ENAE/OS43E
	QXVIIK3if1fg3B3rNggX2c0zY/m3k2xtWU7VaHAbiJ1hCSByk+l/R2AyzSj2+rXQOdg/5al2YsV
	mXI05UShJhWEE6kfdr7ThTRf6HgMs
X-Received: by 2002:a05:620a:3184:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f6f858af6mr297885885a.74.1792750453257;
        Fri, 23 Oct 2026 03:14:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3184:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f6f858af6mr297883085a.74.1792750452772;
        Fri, 23 Oct 2026 03:14:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] driver core: fix unbalanced reference counting for
 software nodes
Date: Fri, 23 Oct 2026 12:14:02 +0200
Message-Id: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGoz22oC/42NQQ6CMBREr0L+2k9olWJdeQ/DotBfaQKttlglh
 LtbOYGbSd4k82aFSMFShEuxQqBko/UuAz8U0A/K3Qmtzgy84oJVrMb4dl4Takro/GzNgp0ales
 JSZhamE6qk5CQ949Axn52963NPNg4+7DsV4n92n+siWGFkpr62HSan4W8+hjL50uNvZ+mMge02
 7Z9AYYbcyXJAAAA
X-Change-ID: 20261015-swnode-dev-notify-balance-e6f56fb9a469
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zrXlaeL9N8MVODImAgm9MbC+6h+IDc0akesuGDJ2eXU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNyFkupV32iqUVoj1WBjC+fBLY9RFjBnMFWC
 XW7VVu8Vn+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcgAKCRAFnS7L/zaE
 w4e7D/44N63Xe36AQO4g64J2DMWqXw7V7A/eBDcagvc/dCyMNtUYHxrEvKLuZW3OwXAGSyWpJ9+
 ToQpq8o8P4jTVf+oShFfgmltGLKb71rc3KnPF0Eixa3TxKVbWLlKqecWbmBjL0KFn/i8aQOxXZ4
 5+y737dQfpiRAf1RUfT8gTd5JFZCOpchju6GS/tAkQDKuk04Ztte1ET9v4oil3wQktCIhV7LDem
 0RX9ouvu73wGWP4d93EicSOFZDKToZZvqcCDi2F3FojSEhk10JdfftND3GLJcs4S5HWEI5hxUbv
 b1hqQi+BPw8vU4aUoaSI74F2Y0akErUIkpEUpwD9ujc6qUfwe2RBB4JPsDoeZStfGlIL+hrTsAK
 oowiEGDtT+9vE6ucK7NCdzqpM0sHR6DwjqLx2P9uEc61IeZz1Wju/sB4im7/dO4Qolp0WQvRjsy
 mBCz8eTMDyCx/JiFFpyNqRv5lcpSxATu6nRsoSH63r4zGl4zSep3QtXAd0D7hqDCGEljTRsaavW
 HdFYc7JXbxDY6rnQgvvA9cO1GlqWVuBa9IIjIvowjfiGNcXnQJDyeVlKFx/IJUIctzDtLGTCXpB
 dkCxyHzlmpIv4EQv4ai68iON+mnzmfSqIDchj9j8ZEmcXUryOHGUU0WVs+SgfBKOh3aRnPHXu/D
 JRQsYEL4jgCWBvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: a4n0QbTiyoBte-F4SernCo9lR260XhRH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX04REJ/s+3ufa
 a1FGmlnVr/zX4VCMSafL94Q3OVRqrSe1zbXS8zbmpo2kCgeSOI2PkYvavEM99dT0SarcIwiB9dW
 qrhIvAvryCk/QiVnA8/876qAv2FRDMA=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb3376 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=kTkK-H-Q3wn9DOHkRvoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX8IDibq9DjNUu
 X3EkUzeBhhrd3t+DKo1DCOsoaGCnvVpBcTXxSqumw/47EJGcrwKNpN7WRQ3YF842yfcpDWL4utp
 8Iny7xZxUo4XiFVO6qhSYjLWRSg+Z6Zz+fvimESGHi42H38UMS+SJe7f0r4IvQlGsQb03EOyoi6
 6IbM41fTGo3XmN4kS3eGmKmJ3BaRzavRfwVRZN0+6Tcgs3WCVIfo2mBLM2ZGDdXUZ3N1jQ9G2PX
 4PIH2X/1hOELpB+N21AD1WFH7bsZSrfRI8SyOm/MS+EMalzA02RTpNRaI6RSNyFwqSSBboBY4iu
 10MwQruJ4hptMt3NVTOXw7YgPSJfp1TfbAHn6jS+qhhgzZrvbJX8Ey6knwXflMPQFwgdb6C35lE
 cDhTvaIHz8QJgloWDpTZkncghouC67rjP9FK/kzfpAEQTq4otRWgZtLmCeGR49+rGAPFMqNXnWW
 igFE22dQdxj11DMLy8w==
X-Proofpoint-ORIG-GUID: a4n0QbTiyoBte-F4SernCo9lR260XhRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Eduardo reported an issue with reference underflow when setting a
software node with set_secondary_fwnode() and then repeatedly destroying
and re-creating a device. This is caused by the fact that
software_node_notify() takes a reference to the software node which is
unconditionally dropped in software_node_notify_remove(). However the
software node can be assigned after device_add() so the latter should
only do it if it was bumped by the former.

This series proposes a fix in driver core. The first two patches extend
the device flag API with a new accessor and value. The third is the
actual fix in swnode.c and should be backported to stable (along the
first two as dependencies).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix typo in kerneldoc for the new flag
- Link to v1: https://patch.msgid.link/20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      driver core: provide a test-and-clear device flag accessor
      driver core: provide new device flag - DEV_FLAG_SWNODE_NOTIFIER
      software node: fix unbalanced reference counting

 drivers/base/swnode.c  |  5 ++++-
 include/linux/device.h | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261015-swnode-dev-notify-balance-e6f56fb9a469

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

