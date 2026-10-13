Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256D5452B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922553; cv=none; b=fVqeLCDUjM4Mk3NTYmcQOQKfqJLviyYmClcYSy9R4mUMZEJD8TZFqaR5+gP3kCQDK+DM/qd24tHVu1HTue9I+AQ+1LG0YHZvmnBFB0Ws17bqkdb0lGmaCoDTUQNmAiQw2znuZZ+L7DHpxLV0U4lBn7zcI9B4tmq71dxICJsUix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922553; c=relaxed/simple;
	bh=XEdgWnlnp+WrdXDPIgVg/CPIC6pGiI8j0SR5FY7OKm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2w0Sc/m0omcfoET9p+A7h5Qyp2hxR6i5fgMdKbonc1T3sBl5kzreg8nAg0haq3eEHG4eP7TEsMnuky2jFa3Ri/LvS1qhJ02LgJUDgD9sk9Qzo1oJZ+S3V5eA+IxU8QtQYnKahu5VabwmTwuzuBFn8r93lrUCtfrhQ45T+bNvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFtjtRIx; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFtjtRIx"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6de1fd5f572so1503921eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922549; x=1792527349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqAeJF9RdF1+vlcqpXvRCOXwyjxYtKo+iVbyXPC3Jlw=;
        b=RFtjtRIxm8AvYtH9FLe1evJ3jXnc/pCnawHtOM/XYmB5p3k5DCo1t5A7EnxsZBJpTJ
         oEFjWMiZ9JRfbNj4BhFrQY2iLGdepcPdStRKzMaQ6LXGpanWlP4RWuzfXMWLXamWHEwZ
         LoWlKH9PCK7Lt35dubaeDidqLdX5KWqNSTyxIMETCW7RxjJJH0yB5H1Mmg/NQES1hlqw
         tKoA8enJJp1mS+SYOyhiVPaHtzgueT7OF3QTahCVs688EyjlRkPaHrg3keElpClNZqRY
         sPlDB126S8f/Cw7OmS1pxwHzi582F3SyKputWYOez5xv4NVWd+gdOkuhRfe8sp2bwe9j
         4SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922549; x=1792527349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqAeJF9RdF1+vlcqpXvRCOXwyjxYtKo+iVbyXPC3Jlw=;
        b=a85RSQWqn77yMaFXgC4lWJfBNlmWTkM2kkP1TJONxLQMedHFH7LDXyFkM/MsZOVDFU
         JIrHeTOu1P+gqDnann8nleQkM+IDVtFK6PojiTr3FH0AnqhEDg6cfGtfhk3pb6ztSIuf
         NmsG7QbJEzBF7gyxWFaeiyh9MSqHlv1o99qopdsUMqiuOsrDpUdv9YQ81XTaA6DHN+dI
         vdPD0iPCcla8y/QZD91eZkPi1DA8QuCUKseT7SYLksSUQ1VoHQpDXXUM7hTB/irwCxs4
         aMFNVurs2I+ziuMjM+tAoA6VmzJ1G97LuopAON1OqVVC2r+sGXuU9XyFBz9vTs/j8G4h
         FCAw==
X-Forwarded-Encrypted: i=1; AKwUvBwBRi5M3VrMzESvkbyYnG9+9TqsRreMbaZawlEJKNm4QnUe+JxDHvkG/jG1FYreeh6CHo1oaE1OkFP37hA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgfLkfQM4nlYlJ7R1u9FL8uTBxnruGiqQeODHsZo4xVohrmZJk
	lm/yp3e7qMpYUa6S+kqozmEjkj9KScz6fQWA5ns3H9QOJWffx7V+XUhc
X-Gm-Gg: AYBFou01wbT0sbZ6m6vDrJIH+lcFcbsnKjDb8Tmql1VQu7gXw5qmtBoUVGWX2AfJZy+
	ZDPW/vkoSr95rneXBAeF2Oj7SclDVD/y45X+eiZrScSFYFcWzrx5E5Q6Um4B2ZPU310WyfTXEjS
	uzGzTixarYJLAklDScx5sR4ei/DaTbaDG3tqXQ3tczoEd5uMAQpqElsqi1F9Ducoe8T00MmBJPj
	hRuP+6qVIKUr5k5N31RdJdFr9e0/jZI2pbCVs09yyEdUr0lwIC0aM1V8qo71IXd57BkJmVJauNA
	XgoV0P1eUa961sEBF58MSMu5MnpxXVMYmFNFHEj0k24loWTkdGffLSBxOFS/4JjqhOvJM77phnJ
	za5MrSEbB7xK10uQlX6EgwIt4Rdl0k++UExklT1EiiawoMA25zjFbF/EQPxVdJW1QaRo5zo0NQJ
	x/DzggzAJX6HqyiGM6900y0XhQIev5bFo4j9+vyej7+l8tZi2CSelV4MkZ5sIt3TLU+RAjpIEvu
	mp4HLfgm8pKIw==
X-Received: by 2002:a05:6820:2d0c:b0:6d9:779e:4f88 with SMTP id 006d021491bc7-6ef08e7d448mr9812220eaf.8.1791922549289;
        Tue, 13 Oct 2026 13:15:49 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:47 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 06/10] staging: rtl8723bs: remove unused num member from struct mlme_handler
Date: Tue, 13 Oct 2026 15:15:34 -0500
Message-ID: <20261013201538.43156-7-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The num member of struct mlme_handler is initialised in mlme_sta_tbl[]
with the WIFI_* subtype constants but is never read. The table is
indexed directly by the frame subtype in mgt_dispatcher(), and only the
func member of each entry is used.

Remove the member and its initialisers. This drops the last references
to several WIFI_* constants that have no equivalent in
<linux/ieee80211.h>, such as WIFI_ACTION_NOACK, so that the private
frame type definitions can be removed in a later change.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 +++++++++----------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e315d693f..3096d4c61 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -12,23 +12,23 @@
 #include <linux/unaligned.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
-	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
-	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
-	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
-	{WIFI_REASSOCRSP,	"OnReAssocRsp",	&OnAssocRsp},
-	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
-	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
+	{"OnAssocReq",	&OnAssocReq},
+	{"OnAssocRsp",	&OnAssocRsp},
+	{"OnReAssocReq",	&OnAssocReq},
+	{"OnReAssocRsp",	&OnAssocRsp},
+	{"OnProbeReq",	&OnProbeReq},
+	{"OnProbeRsp",		&OnProbeRsp},
 
 	/* below 2 are reserved */
-	{0,					"DoReserved",		&DoReserved},
-	{0,					"DoReserved",		&DoReserved},
-	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
-	{WIFI_ATIM,			"OnATIM",		&OnAtim},
-	{WIFI_DISASSOC,		"OnDisassoc",		&OnDisassoc},
-	{WIFI_AUTH,			"OnAuth",		&OnAuthClient},
-	{WIFI_DEAUTH,		"OnDeAuth",		&OnDeAuth},
-	{WIFI_ACTION,		"OnAction",		&OnAction},
-	{WIFI_ACTION_NOACK, "OnActionNoAck",	&OnAction},
+	{"DoReserved",		&DoReserved},
+	{"DoReserved",		&DoReserved},
+	{"OnBeacon",		&OnBeacon},
+	{"OnATIM",		&OnAtim},
+	{"OnDisassoc",		&OnDisassoc},
+	{"OnAuth",		&OnAuthClient},
+	{"OnDeAuth",		&OnDeAuth},
+	{"OnAction",		&OnAction},
+	{"OnActionNoAck",	&OnAction},
 };
 
 static struct action_handler OnAction_tbl[] = {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 847a1d75f..5ef81c347 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -205,7 +205,6 @@ enum {
 };
 
 struct mlme_handler {
-	unsigned int num;
 	char *str;
 	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
 };
-- 
2.43.0

