Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79224244687
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143485; cv=none; b=DHy20eKkY8ddN8FSzor5nY3kMHRdhQDFVL5Y6Fs1o/PA/VN39so9mVYB/2lv53anqUGihnPYjbnPfs3si3KXfhc9kM8sCOr3IbAQvZ1hH/E5mDZyhyl315OHXo+pGF7KwG0E5DIkjoNO5w/59LGNJgvceRPSzQPO257Wo7nYUTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143485; c=relaxed/simple;
	bh=bvrVATNrYUGQD4mbSi+niLn87cAnb4xf2QWn2yNGmnk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DA9Lj6L5trOXNQk0rqP3BPl7CLtEu4k68ye5r/7UNZRNGUrkfWRqsblNvsy+74RqNoN0cQYkfiBs8YeHcFx6rENptma9rj5nythWfaK9NFyxuYisRhD4ZVJKUDJ5x3OLbx4kJR0PnP0hpCXZT00A3Y21l88B1FJ/fBP59fqNZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUnGCFF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQJjNtdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUnGCFF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQJjNtdt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iV6P3095889
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00Xs
	gdwyZ3e8=; b=PUnGCFF+1G/cjc24MgRQf5snoDnCog3cmHmDWAW/BGsxnB+KUAE
	FtaeYjEsFzsyFyVBO3WLdw2G/ufr2V7ji4Ko69dPB4KHaz+v3ax/LHLSC5HkrkMx
	9y+3qMSDi2uW9tgAhkK6eDuhXZe7BTpDBeVNMXY33nuj1839gVaa/Un1m0gFQ4bg
	3VCNNhg3SzBPx7cRl+7nW65yL54Tf4yKKCK1uqEhXkDLHqnW/h9nJK0Txiat+LJr
	pQELSdZ4luIJUT1/aIgVjRaEa6MUwNGsdG3brhewRvRg3Wx2E75FvGS9GVFXa43p
	Osv7JUl06QXGltr8swvFHriOrlUtW7Pk/LQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428s3fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:04:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1612013c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790143483; x=1790748283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00XsgdwyZ3e8=;
        b=hQJjNtdt4cQki8J9IoFDW92zyi5I3NkWXTx3bQlJH/MLfQAxlXgjIyWz+XDFx1slxE
         k3hoAzqzaw/rhU5wSpmrIRG5Z8CT+q40qLwN/gP6nTtqZIbscYTvsQnJAxT9kgJpu9Kb
         tglJSiXY0KCW/A2K4khkRojfxLlzyDgnuiO8a1/2+nrdj6b790BS7zirWtgl9IH3KiSf
         CORWAmeApOU1D7xyVOZhF5ZaR7+Oo/yOLAaiyY0/XKiJhdSymMS9a6TTHa6Ul5gk4vSj
         IllqfXBgwntSrnUIFsGOmfVAx7mljvFC4ohGWFwBypYU8lWh8g0GiHpP0JN+bdMl/9gX
         w25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143483; x=1790748283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4IntU3s8x9cUVN8CZ1tZN89y+BE+ON00XsgdwyZ3e8=;
        b=j94nlzxLoiecHL4r93+XEKup0DrprWMLzgjtH9iIzQZGQTbldkA82ezBLFyaNw+I1w
         O2vXP4zSpZwKmOlmLts3VV76r7YW7QlI/4+gQP2Fn6OsHGCej6LBsH2YMFShKTqU4z2m
         Om+dOKeL2Ewl/Nu9o7jZg1VxXV1/+Wizs4ODAz8GjgH5bj8rVvsIdFj058i+s12tYx8z
         PE4uRQrdgM0YYoVstLiYREYot3X9CG/SpxoSPl17NsivojIWD5WQns9E/Rl2EZw09BI6
         4P8p59txxExpzniw2DQ3OUWwG4AJwseh/h7gyb4I1qAzC80YWh5PI/QAs1AfPMeuY5ns
         ysvw==
X-Forwarded-Encrypted: i=1; AKwUvBzq2kOtWgE8QNV4BoK5IJ62tWubeWci4vCdm1fN+I0iLNGq+h3j4Tpyo4UD016EaX83Rhe5FYWT69FJS30=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ4h6gN1MpRYgORgpGlHNGaIfwR3cXgDN/Gyy/j7scvcYU3IDK
	da4BpFHv/Rrfeb669p6gJE63aC0mhvkDND5jsyfhtGHoi8ASs6rdCYeCa89qks/zaC9QbIaThep
	C/41R2NPa0MdgOBXp6FGZj+xL9Z03/z6OR2jQaSjPkt16oc0ABEv7AqkA+4UN9SmD0eI=
X-Gm-Gg: AYBFou3cHp1XKeu8PNmvpfjCu2u1G3OivOeX/9c3jkBjwz/+iOYd77sM7+9QyC02OJD
	BO485PCZXgFvFOlePWmUh9g3KOVS7/EczCum4/wMp1Fh/9NrCjC6Qj2ovjhrhJvx2Qe+gTQhr4k
	dul2j0SfFjF5EGB88gMvN3SiLygWfMW6ZeS9q/1e0Hx1czzn4D7Wl3P1a48CmG/0iH3sBCTQw0Z
	5K50toBpkiYy9LmOwY2hPJIxoohBbwHQws4hgs/e/xUTL6Oc/8U5lI28BcVAjV9L3+vFJBFJvR0
	TqzRHRM1j0EcaRISJPGGFjkuwNhLCC0pfl09QcBacoIAWINkL+hOBZfM1ICX0fXwOyvholCRX+O
	fBDiTz63S0ct+A2e1rSIDOBI8OXbmaao6uazUPDU=
X-Received: by 2002:a05:701b:4503:20b0:143:26cf:8616 with SMTP id a92af1059eb24-144f91546e7mr1785665c88.24.1790143482489;
        Tue, 22 Sep 2026 23:04:42 -0700 (PDT)
X-Received: by 2002:a05:701b:4503:20b0:143:26cf:8616 with SMTP id a92af1059eb24-144f91546e7mr1785639c88.24.1790143481871;
        Tue, 22 Sep 2026 23:04:41 -0700 (PDT)
Received: from hu-uaggarwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm5050512c88.13.2026.09.22.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:04:41 -0700 (PDT)
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Subject: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling notifications
Date: Wed, 23 Sep 2026 11:34:34 +0530
Message-Id: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab36bfb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aR1d7MnS8zDfWtQP9dEA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: yvP_CO6TSrSBrgRVySpoEztkZPBFyfIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX+SiUm54wpZx+
 msCz8+Nrv9jFqjiT0R7PJzCrboYPDQNHq07CzVOGEHA1ciweNVroGAlHPoOckmEbdfrWhKPfA0t
 fmMcSctj+9jjDlqx/0PaV0fiX1lN/VqrBbod2mp7oiUK6HGy/+TgSupCAUy13nteR1oSLm2ZRrn
 z1fJJcfWoJuRcMqcQLpMhaIuSa6W0bSgDCpIC1RUlFo7ktsdf2ANKVkec9h2iJmqWWrm2XNiJds
 4JKH+wklu5P6R/XBgH0IRSk1y8hVGTvpiT56Nokeyry0TQbliZQSroggZ5tNAKlsDebG9ezPOMb
 vViM289Jy1z+QSJzRDwQHV/R93liaidRic3u9h/JzBa+uJqH4rgtTiDz0x6LwYQxZIOQINflpVr
 Y6/2ak448CrDnmayvAsHwp2gQ9ex1dmYwUU6kTjwr1TW+e6D281LUSidhvm681H96aO7dXC9A2m
 VYJHZ2XWRiYXYGlQLsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX8W1SFvOdj/1v
 ooTEpj47QcujLtY+aw8kakffNN/JNG9WhoDKmMA4TL+K9E3ly89z46hSR3hpEgLl/eVx1lJqF+a
 5z9jB+2Tfx+Z742f6O758LFwqzWNZ00=
X-Proofpoint-GUID: yvP_CO6TSrSBrgRVySpoEztkZPBFyfIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230024

In ucsi_init(), ucsi->connector is assigned only after the
UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
is sent, the PPM is free to raise a connector change notification at
any time, which is handled through:

    ucsi_notify_common() -> ucsi_connector_change()

ucsi_connector_change() indexes into ucsi->connector to get the
connector and schedule its work item. If this notification arrives
before ucsi_init() reaches the "ucsi->connector = connector;" line,
ucsi->connector is still NULL and the driver crashes dereferencing it.

Fix this by setting ucsi->connector right after the connectors are
registered, before notifications are enabled, so it is always valid
by the time a connector change event can be delivered. Also clear
ucsi->connector in the err_unregister path so it isn't left pointing
at freed memory if a later step in ucsi_init() fails.

Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..8f7b73a9f4f4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
 			goto err_unregister;
 	}
 
+	/*
+	 * Set ucsi->connector before enabling notifications. A connector
+	 * change event can be handled as soon as the notifications are
+	 * enabled below, and ucsi_connector_change() indexes into
+	 * ucsi->connector, so it must not be NULL at that point.
+	 */
+	ucsi->connector = connector;
+
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
@@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
 	if (ret < 0)
 		goto err_unregister;
 
-	ucsi->connector = connector;
 	ucsi->ntfy = ntfy;
 
 	mutex_lock(&ucsi->ppm_lock);
@@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
 	return 0;
 
 err_unregister:
+	ucsi->connector = NULL;
 	for (con = connector; con->port; con++)
 		ucsi_unregister_port(con);
 	for (i = 0; i < ucsi->cap.num_connectors; i++)
-- 
2.34.1

