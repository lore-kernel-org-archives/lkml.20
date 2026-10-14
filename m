Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F54C9E0C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016576; cv=none; b=WuQxArnrBtqK9gANqqR8JPHjH7+dUPxxR2LYLxaAtFukXTPFB9mtTCwgyXTac39JyQveAoy4+XVNrTXhxZQZ/OEn0wUhMckFcIWm70FOPtHDqL5fQUYorD0AGJEft97HoRvhS0eFj7TJTm5RAQUC13/LnMgO0UpAgR1enPfynzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016576; c=relaxed/simple;
	bh=JV6Plj3R0iHBSfI0LE4ZZk1iaGp0QitK5wRces+OM+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=BkLZFlOzEP+7p+QrGb/kg77u3fyCHhVOtWnjReLg+8M84zUB0Cue+ZDt8u38CPof4O8MGjk9Vv1kTwXd4ROeUZstJdrqpMiv/qakKx59sEOGI5d5tXWZjIMsTd18Lh8wDVd9iYyczdgKPzrZL9iunsKTGVgGY3ww74muaRR2XqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=HH22UHJd; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="HH22UHJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792016574; bh=g6oy0nU/YnirXHZOdkgWO+qlky6gP3LJ7xGc7jBOseY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=HH22UHJdI3Zpp++LzaOiulIT3DNOj6Xg5BSQdQ6sYee0MLw84idipcXMLwA3i9d/7nUZ11Gq7p0Kcdr/Wotp4thKq5Ku8fsX0D4m+ironu0qZWV6FKqF7Kz9+pbJl6QyEy21wCA2pqA2jEQEzzweBWUNgh48UG9yuTFCsmSlUREvgrk36HOoGgwmPetcnWVOVVIbQVwcP4Mazzx1lG3iJoPFJmObYcsSXOifCZRsl7ZGK6lEX70lL++tbT5YJ1xyYkJguLDQmkJvcee/v2n6DaM1FwKOF9lNUBCJuzY3CiPiaWoSl2OhQ45+HaXlTKYEbyauUEDOoyD44XLVwoX3wQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792016574; bh=eaWNO/jDNfkIOtEnoIAjqVvesfLEfSXaHcs6r7gDHea=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=F/Qdizc6lrmtgeyTXf7nDcPocIOZjnEExkt+QQPLJsfJvBbsfMdgajwVdsqX+vj+UlfjPo5JsdS2f34ScWyq0rbPlah4ceOUwOcawoGlbQQ+qoA7JJQ0qsxyg6yXWTCy8sY3ctv5cUaAxU/+6iV3e7sgMKqAAwx9j78gOdW1DDNies9MT+pZL+rL17BBXHtr9OTzxf4n1o/HlrY66Babmatg5OhvmS2aay1i5/jXnzS5SxGSX1Dlhf+bECGDAYmHt0AcBwZdUDmPDYuHpt3y2vEyQ587ZQ9LSGzqQHqptwGYfaWEVN4zNYSsXuF/Rmm8SaSkivNlzR8xyHUwIWeEYA==
X-YMail-OSG: NcctO3UVM1mnvi7IdEwp26wNAtqNmkrbv.u9.LiBy..HxKoYWhu1O0zo7lfGroQ
 tb8vDfW0kEQJwwx6YqLO0sXPJiN9W4bmQg3Q5SgyNY727csfOgdCT944dacYjzCxrxJnAgYJYll3
 6ALZ2FBiXr_L.epGoyeCPkf_P_zVi_K6K9icsg9mfhjdoWE_CiEugDW0ncEUNtPY5tZDsMC7NTlR
 MIheON2z1V3feRLQdZhIGVNPPFVabTyovDTi8bUEqpmEafcs3.k.HqflNmOtWqoQjHhoOttphrLT
 fgKPJAPGDL0e_3oJ28cOg2lZMys979TNd2WaWQQrqdmxP0hLaa.OsqsFIDDLpJiiAU9nqlksD1AW
 RrjKQt3G6Vn644vZgnPYwiMBGcNHpmvpdfttgNl3kAmWKx2jchznHCYWop7Z8RZSX0houb_YzfPv
 MkTtw3unHKIHET8fPM06q.SwLcu.n1VFk.Sw0PjzzqSK_tsvS7bPEJfmg8cMse.gnrh2hhRgTNTj
 sNYytJO6yo3Wrwr65YHyOfcHhsnpH6YxIX9evu7sqyHkOk5fjf4286_nnbdTq7areFi9iTjCXxMD
 s8rZ1Ijmv7QlTJEKOaF8AEuURBEyfVvxmpMMlQEfus.MrN4H82TQ.mnUVOwqLGPhltAvOQXTlFQL
 Xa9ue3TSVMfI9aph2rSs6VcrptxRIm78nKfRCpI57HULeXm_f_Gg48ErE1H6KPoZ6lgVbEyxfr5F
 hBXebomv4rcM9OAK278py_gKX0ueWDFiKO9bkkzDxFsMmd6y2V5EEoPMIz2a3DKP0VjCnwI2Az72
 4.kYFg5Nl1aa19k8mUDrFYdJnMD_jhw7yM1rGWyTAs5ZAbZIQxgoAB.ZniPKmVhOZDZYFaAgBCZC
 POl10jhJX.xWSuA9i8hDROWxRLiMaW9KJYKIWlk0k1rFOAvtA1h5YPqUq8WsjW.qu.XrU21NCZlG
 hnPepdBb1pYlLCICOftpDFVWKWDZLyuYEVp.9XSLls96vqJFSLZZfxt8iQqpEEcpKJc.9ZcoFnGH
 eCtLyAdAFt9Q49cHA1WXR_2Zb6E.KMeAEpq0QYGUVgK0ce_kb0oJnr4koU5F5ShnBzuoyOqwEOP2
 zxUsvesK9rKoaVXWpgznuSsnHV6fzwDYdYa9iYzQzFwA4xoTEMsaJKRaHj8NiMCwfBR8t2nu9uc1
 s5LzeakEUdrARPOH2QZcAPPcuz4tK_E7c9cY.HsvTrMDKRug86N9bahfMpbi6bg52DwwbOupeaDE
 xighv2z9lyrt43prIP_u.CVQ9ipkJSuBvvpSQWz3bVa0_WV5w.FySrMZ9w9PHtpyiJ5OEU.I6J8G
 CBNCrub7.Qt3JNqaf6HLtdgXpPsCCgbGRydqBtium8srY9_JnxQu_009RqezYQK4vjKqS6FFs1Dh
 ygCA5ykQrfSwokzzxNku2IO9bM2E7r3kCeTUgYT7nEK9pL4m18Kzaa61ZY5ksfkoPJ0b1eEjuY_3
 8L4GIntcjfNLuOUBawkyO9oxXePb4RlKHcHxYweonB49IqbXX7xnUL9FytsBVYIGSJ7XqMNrqpY4
 OTZo4rVYUXsV6Wc8UPJejyjdjtve3QFsvcdw4AeUlMZkMoJYhq0eXpsGCTVrVUBH611yqh7_NQ8D
 Z4hFRvYUusVy2Hd24dgULDuk.YWnROSij6ovZ5DUCSGCsI_q9M.SZWbjelppVrLl68LUtOwxLsfo
 H8YzO0mE74oJVC.468q30z3eny0e7VRbMrZ5ga_g0MYdne0LSBUbPw2n7Up2qCUfHuFH9ETQLw1m
 R_dzOOw3cWoC1DeWQNaqRPE2YALpD0yEU8JI8Dp0ndSzW4NDTGlSPm0ve7.jYA51dms8guy_FqaA
 v7oLkvwaqEqRxOe1gynqHFl0XuLQs66psPlX7igZI81uArAgw2GKwDp45Yfsg3sN123mDIkcKRf0
 hIbrg1oBnYsi47pDci8m5whOTYV1lLOSbjYF2ojBS31W4Feq68trJ10in8R1d.ec3od0l9CDVfTa
 6bqOQXf3r8jUOA7_7tOOUJoH5a6iH0Ny2blWevCDVEdChTWBCYdHqP60TVwKPLM6c_YjfBlKBFq6
 chlSW55DWeJgZtlAyjgvfC8xaGFyX.ybOXjM2_0dAk_0mnwwhLYV.cRZ6YkcMZ_TzRvTKewoBMoz
 xRbCGdBWlXKKKr8Hk0_jhTm6Vs3vHaa5l5FZet4L3a3pDrlWKX97C9H0H50.5bb.UCL8zFJ1Hdbk
 ux5klvY2yv1aEkLJGzhd2k1wdlbQWuVk4OyTt86ynnImaajaJJ6DdBgOaD7kWia4xicI-
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 07c27ad4-72c0-429c-9b2c-098160be6176
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Wed, 14 Oct 2026 22:22:54 +0000
Received: by hermes--production-bf1-6d6877594b-5ssw4 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 77450296e97a96797f2c934e50296e27;
          Wed, 14 Oct 2026 22:22:49 +0000 (UTC)
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
Subject: [PATCH v2] staging: greybus: Remove unused header declaration to_fw_mgmt_connection
Date: Wed, 14 Oct 2026 17:42:48 +0000
Message-ID: <20261014174248.97561-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261014174248.97561-1-deaner92.ref@yahoo.com>

Previous commit removing a function definition did not remove the
function prototype.

commit 3228900f80c2 ("staging: greybus: Remove unused function
'to_fw_mgmt_connection'")

Function header declaration needs to be removed after definition
removal.

There is no definition of this function nor is there any place where it
is called.

Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
---
v2: Fix grammar and spelling in commit message.

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

