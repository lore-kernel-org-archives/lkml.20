Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198692;
	b=Oz5+7UxtGKROgohETHoBcOcX8YAbNYWWcYtuA2Y+zWp24MBkieqaE0NcqqVps77zW2FW
	 bxDeCtGnzmok7m0tRRL6z9/P4E59upK+89wzJuCf3dIn2hTFqvRztLy6FJ2I6fiHio7Ou
	 w3ye9FxHhAU88xunbj64lZ2PVFpM5kpajYsXp4NspGVoRGkVYA3AjT1DrU2rVT5Idz0HS
	 ekD2twnSDfPf6WWKuMJwnNarFrqoFQOg8azinYoPNVjMVASMa0OOBNMP85EYySaME2BAj
	 u7dZGY1ZZZmtBRsyMJZH7+7P3UF3K+DdZYSqxq3IWNYeDsiApjWar3G7AEzXp9GJqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=qnW16eGpasjQvVjWwkJ6caTB1Tmt3fRM+xFG+N48qLnRzzbpFVygSKbIWyap3KMoNuwK
	 VZyY/xKkH9vKvKhPH1wC5zbEew0wadsD+F7GtWX/ztcaRtzms3EIBh2MpB2WD0kIvknhL
	 tWQs7pYdJ5nDwW3BDmdjOUm9f4Lz3TcxtZz12VE13s0/gYg3DjFZmJeKQR3gT+DtfhyzN
	 VVJh5rwP5HEPhku0zA+Xis1ShV6IvLqnvAwTIjM60RBde+7vM2pO85FGjG/AjYL27bNnz
	 TSiMBn0yJQ7c/bTCCp8cByC0xDFDtOUAjHUck4AD71emxc/jhtDfYquY46J242oM1MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAA60A262F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CAA60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIOmq3917073
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=ME83Iq1SZPJKQFjs
	pY23U1GAxnfRycuRqkTn+8/q+/+pPlwl96U6OXtQ4yHE+Us8CfdAhUfhupOx9NpW
	ExHwBzz6osq5lRUYI7kx+oQt7hSi994gE4WnfGk6fy8JCO8YJIhICN7by1lsx6W2
	4UJTBKfiaskGsvLz8xPqwrlCxlZEN313wS7mMcoSLiQ8Q7xTl0agpSWFkYeIItyg
	pRJLgW40k5RQvW+NAkaDQYChToiHHNX2o7cBzCCo6oVxT9b1H9VqWjaWXdxoBbJZ
	t0eyfd1TPtaQaov04zV9Ge9uc8eWx1FNPucps237Y/kY6nHHoRcL/+600UU+Klyd
	mXXvuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngcfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so89964485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198690; x=1793803490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=Irrk7s0O43cN5uVxr7GMDB1TmVfs5d42xWGWmlO+puEDYQ4mR2nKnK6meq+mRxDa+H
         PhPINEagHOQ8ToR/KzQvg8FRKJ416hRI/95jDYw9vGjCQxa5iALGnpDCsiRWpRA2iN6S
         6LVN8T8AfeYpPUTGTtQdL3017zZi5jQ04GUzk+6NGOXTYEH0s4vpZOvWBkyOvFRJ4mTX
         ByJATdcDiwF832HthDGbOhzkffNy96/DAo1QySDOMm3ErAGbCXRkON8hlstTS8AYU5ou
         8ENfVSRBCN0zLy5tKPMj4a6uaVm4V3YUicr1c0h2Hs43nEOgo5XP0xvehlXVUvEZblmB
         jjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198690; x=1793803490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=EbiJmUYa0t50vQXX4uMhLFeajpWzmy+8rB9R+d/1Kalg3hbijjQiMrxBm4CpGTDGxf
         7ESSSCRdrlRcZufSrD/O6v07/bxsIa32ydIAY5cMGi6jV2ZZgDiYfdLVbwxO9UoInuQI
         JKvNideqxShvx4EXxzl15jqNBalCbztDfclgv7PZWbKR4x53mRVpX62beX1qQmbeNSde
         mYi2IBEyhoeNUDMGWEDhZq/yM7DXRJgQaGgUCA4EUbZNGuMG590fP7/O8Pv1pA8GYOe+
         U/PVzdatuUCM/q9KhAhwSkw7HytjZFYzeB7GVs6irmpAiTJuhxMQISBtdYH8xqsutwKU
         oxjA==
X-Forwarded-Encrypted: i=1; AKwUvByXvy3h+QUIIgjVrLputxRNK+a7BvF8MZ+NINOR5bPIRzk9HY86pCU3hnJgOslOTxzwk4/rVg77e9OcPLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYICn3US+Kf6rHfvdGzXqABuU3mqO1pPtMhMP0LtqipCIawF4eek
	9FL8rTW964miromDtZFEj9JTM9otCYc1uIN8078S25yvp4aYI+t4kSMKcaSuPZd8Vhdj/fqup/Q
	JP1n0Ngu3xh/5fB99x9M/mUXoteZ2f4elajLZ2a8VRTIZlavF+wI6CwXhgAE8t8yqqN8=
X-Gm-Gg: AYBFou0EB82c4H3Eqo2H24dmAOYsuUJGlyX7gOfuIxKSCGkhl3PELCMhNUTdPmJcpus
	kruR78fJGyrcZdDEeP345BGLxaqTGg/Bcf73inZVdYFUY0GFMURwuOEVGQqFrcS9QwC5CsRbu+G
	4qnRaYwDF8fio3+z7e5JwDVEOAthS/j07p2uk50KlcVW8XVCgZzQQ6yQ8oJgK27zds0O1Jkr9Xs
	czAIoXWfamb8qmA1TJ2zFNgB5kXZQznIAhkYzh8Df3oFMY3cDsk4y1nNt2WWH7jYHuaQK8FkCCZ
	mi7lhLqt6ZEWg5OUMXjHpxpyTmHRlJmvusqMxrspLN+efQLxfSzX1DR9kpiZ677+s+8jkOsCnf7
	hLX4RcLJRfGWQ+M/BzM9sqW5wKBwDLvBo0/2PCCZRhrNnLufLbTF9Kj3zPYP/04PERwMVl2WRpn
	zENg==
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363984685a.68.1793198689868;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363980185a.68.1793198689301;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:39 +0100
Subject: [PATCH v7 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-3-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpagBqL1CBEVbeJbb9EbwfKAPskFpgHc3fn1
 CdEpIoTJv2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w0HgD/9mAnWUkPVyiu3djErWX+jIAxFSPUN92WPzgtOPD9qxvh8NSz0PYg4RX6SeqPMs04B0BoB
 K+HURvkXhE7bNk2MVNOBzqlkEc25PbAPqRAiH47/BedR9kCRiCAPRMSDTXVQMwIkcjqgeRJkp0K
 kWErMGx2Io5dPHHiIth5H5WmhKa1hQRJhXK72xRohd3fodZPQWHnlMlh+3+RceLgT1VfzVb4r1c
 VP0yWdbwpFdLuO8/0M+MP8LLZc+24BzBgd1InchcrDkcbaV28zuIN1t8yEp5MoE1rYTilcasBtU
 UikZauCch+lAkxTIau+c8JUAvUWw+n0NQ6IBA96/sZWdHzIY+Kcb9OyYa7aHMuGj8QcGuN4/eKg
 MA6tOoe4CkXCF+UVsq29rtxXo+zIEIfn8wEEKP2dhlSxqPV43idpNzSfNs6foRrT5yt178t+2jk
 6V0tVpz98IuCOqHg0KvvRoW5h9vr7ESCvqxakShrZA3WKzux8zZhXDZgM3vR83JvU+gm3DXrcSj
 IQSQOMEQH+rQBAJ3tGK1gtRNOtsDHhksxtpQZjgfHf3D8RtRTK/7rCIYgMFFGnu2gDkc+8gN4XE
 EW18koKCM67I+S7e/7r/o/WfKYPA5lsnY+dFx7PC7c+KGTYWQtdr10GjJQVtYDHrb28E3d14gda
 0f/bXnBxbky22/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QTZHh4PreeYI5RjeRL95UqKJAr6BFJft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX6YZeHFQbX1M4
 SObmfkp9G/V6tzK4oaWd6d+9ofWWZ9DhKbkM0Sl96t4imwZ9wxibAeiLjEG85BK7pRIa1FnXHYS
 cJRNn3fObfmcfn06cfslKDEjicMPwMkgWHreykDcH+ckrqGEJcKx5wgCjIHh3ScliPT6iowi9Hr
 qhvXQVDx5OaginezcSDEfG1uX0KB6KcZn4Zm+i1Z4w8nHHoqb7OoErIiejVky7bfZMd2Czj5G8o
 RNRobR4Y0UsM/0hpt4myEcqksEyCBfl00q8B8Vb+f45bbgOkhuVaFEb2cTZ5izBqqqKyz8nzetE
 eAjGE3l1AcWnfIvCyTVx+u7qd+SPGwJ6gjnI8PPxJWrHhk0BDZyy9i/aOY/sMIgmlGLje1ADUC1
 8y8ykIOaqLIZLmn6WmJkWI6ENKkEMnWf5ZyzHiUUQ4ZIOxzilPQ58W50e/zmVI9NpH/wkeUrNug
 KjAqwJ/51Ks8dqKc9lA==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20a62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QTZHh4PreeYI5RjeRL95UqKJAr6BFJft
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX1RQ5Pbodb69T
 FhLmLjgtLYtTdqSrOKT6hm25NiMrTUkn16BOgkJn5dULNvTY0tEqOyI9latygcSUBPEiiaFMY8k
 87aW6Q+33oTNcOJT4nSMwSv06ogaS4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 47b434db72f1ebd35ec36ebdb35f30809f4522f2..043d5daba7a73062151a089b3ee8ccdac726f221 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 ref->con_id ?: "(none)");
 
 		ret = gpio_shared_make_adev(gdev, entry, ref);
-		if (ret) {
-			gpiod_free_commit(desc);
-			return ret;
-		}
+		if (ret)
+			goto err_out;
 	}
 
 	return 0;
+
+err_out:
+	gpiod_free_commit(desc);
+	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+		gpio_shared_remove_adev(&ref->adev);
+
+	return ret;
+}
+
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -624,18 +636,23 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
 		if (ret)
-			return ret;
+			goto err_unwind;
 	}
 
 	return 0;
+
+err_unwind:
+	list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+		if (gpio_shared_entry_needs_setup(gdev, entry))
+			gpio_shared_teardown_entry(gdev, entry);
+	}
+
+	return ret;
 }
 
 void gpio_device_teardown_shared(struct gpio_device *gdev)

-- 
2.47.3

