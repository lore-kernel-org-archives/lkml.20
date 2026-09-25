Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3944446EA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363196; cv=none; b=K2cmWDyJNRWudNdiZSpTvykCR/w15LgICxY15y1Q1HLWjU8JpDxlySkvnRT1ttdQL2z4XI61U264nfSdwCUyz+CXbAdiVM2dQKaGlWWCdUw4dyUdm23o1odjDZTz5UcjYxdopedQOHkdiz3NFixmdtVPwLMuAgYQxvjK1TSnnYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363196; c=relaxed/simple;
	bh=6G4RPAGmaDjpZzyTNKEyFHqA72+bQZgK1jkJfyamAUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ly/P3VivuUKC9Llb9cDeR0WozySmNF5M9JEKtd4/D7VyXwDD80zjGkB6azZ5B+tJbFWt/nTa9MhBjsMTkJ25gYbpjBkiMFPj3FAChhLw8XbN8LMLy7FEXA2JitjEbITxDVF16+EMiPINqReYBHokkr6+dE4oycbh5do9GPrs7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=php9i9se; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="php9i9se"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so999383f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363193; x=1790967993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Srgm6JvxgKCcCMFCgkofRyicWdcx23+kTiGji8Q80=;
        b=php9i9seJKsDNK0o64FvuoXovWEty/gssKo9UMJ1I6Mo1bDFU7ATR4skdEdq5pwueh
         XgxAuQaQNjZgNuuD491sTA35QtnARXAxVpzpN5yQe6+AfWUMSfDLmPqP8xwKzVtdpEDy
         8otdnhVfiwlOM2Gzqqu0lbyLIJbw8bya/OnxrOBG+dh37ZQYY+GNrYSJFFmY43O/l/xp
         HSLMQVlyve89TH1eXm68z3tYNXM4ylMcmYegfyGQvlAm1nZP3Qa8EnxsD8vGZmwRlGxq
         cC3Y1Wpq78TmNm7upWDfaD8wUwtyvP1ucvg7pLJ2AYkk+bGUKHKEoZZB/DAMBBEGX3IM
         vWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363193; x=1790967993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5Srgm6JvxgKCcCMFCgkofRyicWdcx23+kTiGji8Q80=;
        b=CYL6qSqYRloi84+C7lIK8BBjCzJzYghxB43mq3NubHg41zXvaJ7bApUsBx+jJTVcQA
         YtrmiBeBdSTHGb59W1/B9HTcvpVdCW2/yoFWmJEApXSQpbT/DHSBva35MC9mzN6msDDQ
         ACFWmcmJpWo21lwhNTCrWdKBn/lqgzP7ClEkMs/Ec4NeKnBDJN+EQ3AlCcsK3FfnKfUb
         igFqfdQ8ioMreonamJ3tMiEBIhPX8DWlw+fBN4+sHidX6/Lp/k8TU1DRgikOUeMFf7cM
         Wpd1GiaPJlbiMBTCmfDjFD1EiINtNI6Kq/UjmFNWcBimwSxQzAG9S318nsNtOBIuUGIp
         wZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXBi3I8PfHUtlNWn9orfe0eXMTdyCSzIS4nyFpnFKF1QX4tRNC6w0TaHtGNqU7wVhFreiBU1eE7fEO2ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++npTW9oDy3jdi1tgiLm+YMp6K0e6fpeOyB9P+52CMW6cq9vSlEQ
	Kf805xq9vfp5eoPDSftzndZELRKpjk7SyGU+crPfi8YMfQbGSpxVht42
X-Gm-Gg: AYBFou2m3wA96Owbxf3jYlrhsCWicHlacQ3Bs6pv3YPFRuertQRdcZDoK2EV6WELcTL
	WtsL4yB7YsvGwN7vSkGgybeDkYs1CwcRFaIrMR1a42euYqhG1z90r7wuUH3C/Y4IAq/WcL0cHTt
	zlB1Ylui5HsdNEF9Yahtac5UKVsgoiuxo2SSuz2xM8Gs+HdxQe4pCYO1B14FiEVI9ONT3zPqEBV
	ightZQZQ6hnX591X+uj2gRlxmdeQ9sT6+itey70WQCMKCijbp4tObJyBuJZhnxX+o7wXzPTda4L
	1vbLyPcyEzvvweGXiEsS6Fpylwy76P+ZgRGplgX5OGlYSzV7ry/Zf31ZoZ6arFmrQvBs9DJzHc6
	T7hFVogTj/H7xN1TcG7nr7/rsRO/71dTfhBtSf8TYDssWrZ1U6drqMR6Mhg7xaTH7TwZWrTMMPB
	HOb9Gi026va4vOGUDA9R4g+qelLUaqGa1N43V3ESx6owCUNzYnZJY4zyl0rr1LIr9fERn3SFIHe
	vyOzSJ7R343/2I4uwJTGuYp0SA=
X-Received: by 2002:a5d:5e03:0:b0:487:370:c511 with SMTP id ffacd0b85a97d-488717147e2mr11934205f8f.8.1790363193010;
        Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:32 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:15 +0200
Subject: [PATCH v2 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-6-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 96a1a5a03de8..cc1e64ac4245 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -181,8 +181,8 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
 }
 
 /**
- * nandc_set_read_loc_last - to set read location last register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -190,11 +190,10 @@ static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
  *
  * This function will set location last register value
  */
-static void nandc_set_read_loc_last(struct nand_chip *chip,
-				    int reg_base, u32 cw_offset,
-				    u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+					 int reg_base, u32 cw_offset,
+					 u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -226,8 +225,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 	reg_base += reg * 4;
 
 	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
-		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_last(nandc, reg_base, cw_offset,
+						    read_size,
+						    is_last_read_loc);
 	else
 		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
 						     read_size,
@@ -1916,7 +1916,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	len = nand_subop_get_data_len(subop, op_id);
 
 	if (nandc->props->qpic_version2)
-		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_last(nandc, reg_base, 0, len, 1);
 	else
 		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 

-- 
2.55.0

