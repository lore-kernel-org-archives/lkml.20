Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC88378D7D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876712; cv=none; b=Nq4odz+scZIfAy26Kpk8LL3iVAF9HG0OiMTL3UWe79uFluwSp6jfid4EVR0/bbjYsqq5R+E0oao5FjW5OLqlwWWEtZcmRiksaf1enHYAxDF9la0RJa4OT9Q73hQN8C3tr6RLevEd/Fbd/fgj5o3txwr60WetzBcHNanM2HaLN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876712; c=relaxed/simple;
	bh=cyoX8usjrnz5JrAsQHpENhV1cb6kzzfG0G6czWstdCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bz7ILVoZegtL6vn+gXS1bqaMi2/GGwCOMdSJAALggENmoXPZ5lcwyt06hwtEHWkSoW+wt9+u+C0zTJoAqlYQtvObML2Xkv6lzzNmTwO5vXu4X0tuuDrhSo0j2TLD35ULu2S8Yo/ClPLyv8BnZj4+mNxKewOpB1PRuhUhzMKEmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eJfZLOUi; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jzw7hzHd; arc=none smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eJfZLOUi";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jzw7hzHd"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D41XVQ3475974;
	Tue, 13 Oct 2026 00:31:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pfptdkimsnps; bh=owN1UmmtjgLgzKrUQS3jOpX0poTZ06Sk
	EKeJFoDeNOM=; b=eJfZLOUipDxO7Hhsgxtcn4irSChb2vPKvgesHMIzneNZepwF
	Jo3sCkOJSmFHCxhn8ZnE+CCs7OdLgt19GJVaqsa17FFLi9yRPnGaiKrzwt5xjOWM
	9+m/KirystGhCP+6Ld24518bBf7gikRM9nC3Saei8759m5H4Gs0Zf95yyw066F7F
	3cKxsA/TqO3kb6T4XUyysKOeANQYWXYZNEhzYd7QcKKW/iYlBWbIK7vkFqy53gBq
	ERmF5FpVlTaRk3qC8GHrj2As7YwvKcBLSFblurZkKjT4Rh8KWRGCfD5NT9zKk00g
	FuRwLt+4tLPjefer8qs5rrnnSN/ocjo2/GmyrQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h9419bus3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791876695; bh=cyoX8usjrnz5JrAsQHpENhV1cb6kzzfG0G6czWstdCY=;
	h=From:To:Cc:Subject:Date:From;
	b=jzw7hzHdWfrDz1d7R4UQzRH86B1oZxyB6oaHAlqtUHo0FBykmXz0825IB0pCoTmP+
	 GKZwkdVAepSZtl1SY4pvmrekVBq46yQ8hXSWHzRZkRxk1rHswlCzhQjuEUqCbUH/s6
	 yiUVMR/njKenU1YQo4qj+LuJWlOda9BZ99sDuxM1+wYw0DC+Ks0rlNr2P3Fu7kGR0y
	 Xmf4cRtEZM8GFO65HKpz19+FyDIVT35BZUZK+kphP1tTrNyK5D4kv9VqyIJLR4/Y3T
	 9/R4/P+039QHN+ndtMYMG7JQHyQn2VBxlaZHkUh3O+oRFX6iRaXPgZ/Qo9br7ZB25+
	 vjV45NCmq7bXA==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 828424041F;
	Tue, 13 Oct 2026 07:31:33 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.7.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 8DD75C14BD;
	Tue, 13 Oct 2026 07:31:30 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
        linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
Date: Tue, 13 Oct 2026 13:01:26 +0530
Message-Id: <20261013073126.5948-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfXxWk6BnFiCsO4
 wMVnveNu/pe+PG693NG284bZYZwZPx6pxGkYNSiRrPdkO8QpReHVNHiWs+QPL609zAx/d7Cb0uf
 1sPsxUktw5sVCWFL1l3v+hW9tqvgcCgM0QVUIaxZpWYrqiC8BGRnPx6Sx5rhS+0qaWSyN70Nivj
 80kxVjes/FNnXXZsTm7m8DAQ/Pk5sWQl3k2ItFbU+OoQWreyKkWdP9uRvH2caNqQH28ih5xK/rP
 r6yXa9MUkn/3qChVGwe9F4TJLJA+1x8ZYJcHfrP/VYhwpsjCGHJg8u07vLivPo854uMPUndgT7z
 n6pa98Cz2rOh/6Ach59OEkKiRSSmKUdC4Lb/QO2tIcOW64Vu7zStU52XRBPrKfLIU2JltcDKIPO
 nbAy/7SzGS1DOb0f5o9GTaB/8GJTsufGDzFE23pCaXI9xghaD80i57SXS2FnXTbcVi5G0djWZag
 FtI0n4u0DfaoAcivdog==
X-Proofpoint-GUID: 43xQif-LFZZ6U_x2XNINNIr7PoA6FSB8
X-Proofpoint-ORIG-GUID: 43xQif-LFZZ6U_x2XNINNIr7PoA6FSB8
X-Authority-Analysis: v=2.4 cv=bZf+w+PB c=1 sm=1 tr=0 ts=6acdde57 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22 a=jIQo8A4GAAAA:8
 a=z177fXb8LXOLxaScacMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX5B3QKotfEwU9
 VA3ETvCKVaL1BUwHeiUMcrYFiTqjVjhe2KMjtb1FVuQiAT1zxJll/yc6Lj4YzXu1uxjNWHv2woV
 7OBjfVdVcoVmFji8M9eb7EXxlcCvC1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1011 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610130029

Implement HDR-DDR transfer support for the DesignWare Controller.
Only support for private transfers and does not support sending CCC
commands in HDR mode.

Key differences:
- Sends ENTHDR CCC for entering to HDR-DDR mode before sending data.
To do that we are setting the ENTHDR in controller cmd. Sets the speed
to HDR_DDR_SPEED(6) to do data transfer in HDR-DDR mode.
- HDR exit pattern must be sent instead of send a stop after transfer
completion.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05584ddaf104..58c54746bbe5 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -232,6 +232,8 @@
 #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
 #define I3C_BUS_THIGH_MAX_NS		41
 
+#define DW_I3C_HDR_DDR_SPEED	6
+
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 
@@ -1017,6 +1019,11 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 			       COMMAND_PORT_DEV_INDEX(data->index) |
 			       COMMAND_PORT_ROC;
 
+		if (mode == I3C_HDR_DDR)
+			cmd->cmd_lo |= COMMAND_PORT_CP |
+				COMMAND_PORT_CMD(I3C_CCC_ENTHDR(0)) |
+				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+
 		if (i == (i3c_nxfers - 1))
 			cmd->cmd_lo |= COMMAND_PORT_TOC;
 	}
-- 
2.34.1

