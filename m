Received: from sonic309-14.consmr.mail.bf2.yahoo.com (sonic309-14.consmr.mail.bf2.yahoo.com [74.6.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171EA36B905
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998674; cv=none; b=SaDk2PROM2X1n2Ut2fJ4WXtRnIn+rJ/nKpQ7aY7nRHGVtq2TjdF8kYyZe8PuyOETvLNmA01R5zaqkpS6+IuQ7OW+Jd+dYU02MsYOAZLMX7tsmz7bn/YYnJ400Jjh+Ne89qEQqqhEPaxQJRiXPjB1zA8eElryQacZJOacHWnmY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998674; c=relaxed/simple;
	bh=XEvKOCv3K+UgHb6IG55edNfPEEVp3CEHek9hbwGscNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=jl+9/tUVI7sblfpI74PiOIe8q/px5EMiitnGmmC+DG+jH1YHXYCh0psCRlaKitZ1osDmItgETui2uoAJT4eiazjn3oqn5LLgp36gT8rox8t3LTEfe+DFHaG1rtB+O/8g2fV86AE71AY+paO/SnseKfVXvLSk1Wx9pmsoeWBTydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=NokvUPxs; arc=none smtp.client-ip=74.6.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="NokvUPxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791998665; bh=4v6XorRSwXhXcku3qnh51d91z1LPE04gABIRSEP3Ky4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=NokvUPxsObEifEypE6lKhxuX++6gRjCgm8YvRZxRBQg1BozraYnYi40pdc7732AzMTOhda0padvXVh08loBTunm5Vaq2/FLXSGFX4msnpcbCaZB7PD7RkWAHoNqFvdB74tvhVbo3fVVErZmXFTIDiSmGyYq1r7hhTAyExqwLzJNkQhUJKLcQneaZVIffArJKsKZVa8b3jUTRpZ07TEiO/xAr4HPjmsdx0YKUOOen3cTG0gcfTxVFyq80eDFG5qsEHtY/nYLawXGlqgaK5yZMhMpIFXaK9Pg+fkcH3J4wrDR2B0CO8EqfLBS9/amIroYvArLiIMucf/xymzf4tF5HAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791998665; bh=NRj/IKKhMNUddCTqNW7z2/TzI11hDDItcsLIVkDzS1R=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=WzM6WIW6ClvFZSGBC7CtePn2NIA8hfk7uMlZhhP1TCg73B3LNNPIcuppOoSNcbq70evfsXRnsWuMmcLLq0NQw6q6pjV74LTvOfJw8EUHD3Cp8cV0nSpTwZ7VA7s7XzdIWMn8kRKip+sYN4WKso6wQJON6/Pvi/tKS6eFBm0FCnLG3OvX7GyR5vFClxy6IPttZLbMTJL3K4Mpvq8voNA1cbWxGlJTwUKJ6YrfaFK2VwhyzP/nKTY29zxwPA9HWt8xlxZSqj5/5xPZ5YUA8onq14AFhYT2DaP3TfAYqSaT8tDZUD7N5Lx6UgApHW1MV5O8FeyjYYEld8wiZdCksDN8cw==
X-YMail-OSG: qs6WiKIVM1kkPGrkkjp7IXVwt.NTnLHSQX.zAef6jxs7DrDflb7UJtR8Da3w9BI
 qEI8OPUEiDY7cNltTnqBPrWdjX5Hz0YtLPZqfcG3BgB6KBeRR6nvsNI3uyzst1ejK0cIJ.uZJF10
 s1sZSlH60FZKEyrSVL7vKSN9SQaMcGWy.amhkpsQlYPIPFgmmH.A.XPk9UP7VgcIvTqWr73O37x1
 Q7gl20deZpZNnHmjZgoTbjfsPEC_D11A..PKlLJ9GXHsn8ajrN4mn2kOMYOY.bXevLhMVwtX7jZY
 Ki2K0Qm78pwUyn4GOj1HOhA0FVPOFe0hJyhRgJj0U9hAhesSYTOi4CXvxKbpacD_gbq0DePKouGB
 jxEXSmA2s6YsYygav6BPzSGEIzeLDXNu8sRJlg5mPfXpWMqRgm.PW5LEOFJQxPBvzzMTf4Wx1dMU
 XOVPKkuQk2QUG1WRIZ1pEzS9ALeWCx2uNaQBhD5UYndSyOMBGSvfUatiULFVuFMThCLeNEPDPUOS
 n_KKmAZP09XdzCxkXy6G1RJLeXoFNnIU7bjrDod7Ke5ZlF5_N66.sXHCNoZNK2.c1eOYd1zq.8xB
 IrV2G6IqtRhZQtPvDii7Rthr6jtlpwzCSj_bWR2SddEXkDE3d4RXNnQfg5o8EBMXwn1RGUq7mZmD
 Z1t4q2umgqapie_v57fqHdRUtYa3TSDK_vtqy.NqPj5Uru.yGG5svdv5NklEVDOyMuoZD8WLz0Rx
 vmEPvK71mVZbtiu9fSo.iGhYAUOgivmsJe72H.5EI4Rccm3exCEytcX9DR8fdaPO3S1qOCaxhKCH
 iOT53D0t7l_XMqzPYWIsAb1awpEubLxTJzM.pzAtbu7q6xfIZ7xBik9RdeMCrV_QeH4EzZRc1Q8v
 FzLeaaGW0iEAa9Eg8vRE.KY_qCWQ676wi.DhcaoA4Puvz80NYhMaD0irVskI2T0Sd4aa1p3Z0Lwg
 7_Q8Zvjd1TELWOitG.l2WcoB7d0C6RHu5q_IZTKRg8unPATcmwpQLWEjWhUC6WFBpdUT5W5cTlUY
 tycenTNy.eriRWv3UK6RHShwt5lU7tY_Jq85Ht0tL2c2XFVbzVqlRBtN.U5X11uluBfTA04VVSlg
 9_OV31cVQa4TMA3Dlc2kZJro5F1iDf6WqG6kpvj1dxAZjDTFKwsPGZUArxIdPbFY817b9BjiLeDm
 8SmFGDo3tUJT3OVdN.XI3HmOAlsGqOb2bSuw6zR6bqgw1sKoQKOWd3FJq1XvIFxro.MSqWR6Ppy5
 6bJSQ_pj1DbBekmojF1XeSjjlJefEnyaPFbEXVFJkngW4qesuI4.3sXBONAJxLWndgv456VGOgDk
 BgqagoePG3kmwldnQHaLMzfaQwPaIpsGkBMbhh6Txao4ozfId6t4lp0V.NPtj8jl369JbLjPN3Bs
 Su7FbxZ.jeicmg8.MnwNEyVFAZX3ASLdCamIlTPGSkCg2A_1zC4OVwW73NuDs7KYMSqy6Cx8Sa0Q
 LNJZyLoh6.ZoxU437VVxKR4QAekYv5ruhAj88bKEoWBofTdBU_L_3O7h_Wtta2c70wz.X9LCti1X
 gZMAU9b4_hQuBCWhmzrfa0fkHcXAln60beJmPpEzkGowK4WTHR038sAaiWTjSYWlbe.cyqPZfH.Y
 WlYisnLOB5QXPvQ9DOY5XmpT5su7sHiNUrmpl9kwsz3tv_3ZavA22xFh0NZiPT3Z_VG8.9N7aoQJ
 dsxGfUY.OPYyIHyqWI6Juo3Fr9UTYglHtubmp6St1ZIrIUGLVYLKrbr8UP20t31BgU4GNTFt_ISi
 vPnu_IJcpEo0nMnPOyduFSvKCyc0r6O4iBQF5qP1PoWNheFWWhJArvYiRQ09t21PZNa6hEdhR4ZK
 ybxphzISr.Vhofn8JD300EjNla1pStkq1_XOUK6_VGWgpJtbni9lK0GWdxgHWLkGbhYA5BwKVKzj
 _Ed2.TCTrgo5sk30wci5YXPrwf9AXsVjfZLFFoUGx6b32nQ8Ghzn2k5b4GjvPMQ9vvmLZ1CyjJwg
 Ckfajp5j1yWvA0Hg59U0qn.h_cvCB4mJhGEBrvGSK.Vl8ekAEAW.JEhfXZXb1meCQwEkFSQfrH7n
 CKZdpWH3jWb1_03wtkL8vWBPjnkxMU9dJnJ_hZr9yu2jc5SfS.EZnoiK4.DqKuNG54NjG0HebcWi
 qMvbLpgkfSqeDo.TPRvEhZaUu1K_POfM_3GQ51lg6VKRjccHxHBKfqt6Q6LgbJb4Ae.sbyxCgL2M
 Dbb1lNThA6N1Qf1Aa0.xBpYD8w7S6CeKiVTWXN4utFkbztKxFnZqC2eTQeN27cfCHJ_PWIA--
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: abe0381a-835a-4927-a6a3-dea8a61793f5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Wed, 14 Oct 2026 17:24:25 +0000
Received: by hermes--production-bf1-6d6877594b-cqkzp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a0a8dec9b05504a6d0243a2b95346ff;
          Wed, 14 Oct 2026 17:14:08 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	Jeremy Dean Clifton <deaner92@yahoo.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove unused header declaration to_fw_mgmt_connection
Date: Wed, 14 Oct 2026 17:13:42 +0000
Message-ID: <20261014171342.97160-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261014171342.97160-1-deaner92.ref@yahoo.com>

commit 3228900f80c2
("staging: greybus: Remove unused function 'to_fw_mgmt_connection'")

Function header declaration needs to be removed after it's declaration.
There is no declaration of this function nor is there any place where it
is called.

Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
 drivers/staging/greybus/firmware.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
index 5d2564462ffc..04a67d2d5b8f 100644
--- a/drivers/staging/greybus/firmware.h
+++ b/drivers/staging/greybus/firmware.h
@@ -22,7 +22,6 @@
 /* Firmware Management Protocol specific functions */
 int fw_mgmt_init(void);
 void fw_mgmt_exit(void);
-struct gb_connection *to_fw_mgmt_connection(struct device *dev);
 int gb_fw_mgmt_request_handler(struct gb_operation *op);
 int gb_fw_mgmt_connection_init(struct gb_connection *connection);
 void gb_fw_mgmt_connection_exit(struct gb_connection *connection);
-- 
2.43.0

