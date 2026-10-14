Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22E55C31A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997716; cv=none; b=Tj5cA2AkTutMfEYgOoiOzig6ZyLeRgY2mJT2lysTLU9dGT3mWePnQuXkcymKdwqgoeTu5HbylfUVzmcTIlQ/cLfSCcUmydpdOn+u0nQW8Z9kxOa9ZJzLA+JbaKCcYMXD7FKkyxMQEdxhjReDQwacG8YQkicIE156clKagE04lyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997716; c=relaxed/simple;
	bh=18W50nwXyn7U9V9smq16pS1vshVmIOIZSXwkdv6O84U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a8RT5+EclmvmqyTSHmltNAtuxUR/0FYKPSy+VJ1CH82Dxf1a7pZt5P570Vb+olrvhcqEjYer1bs+bKa+rUzL7Ql4GDRrKQmS1MWEAcsgk/54yPACDRjxO9Ff462WrlQyaE3FXHL5hyAfL8Ubvnrt01SSLxBbNXyYpFJJuVRdPFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nV/mfdtJ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=or+c5gIa; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nV/mfdtJ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="or+c5gIa"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGYJo93099034
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=OQYG6p9/H5SkzSVfBEy5FmiFS3
	xl893haPgmkNoad14=; b=nV/mfdtJwsdyFL48fZCD7ZGmuZMxwCLeQp5SnLo8Lr
	A8cRDwhYtsFiFAuQH7Ikk92CodAg8WQbgLRqQIk9zKPliDx4C7eYsoB1ByrV25l9
	Zuqhcq682ARPB/qBej31x9aKOdCqPUZG3Z6FzuxWoR/NbU6B6BqFcqw8hw8Mhs9D
	5U1XLcFU1S3YVZJ/S/+nT69vmXHjnM/oaptBGwYGodNSgGKFmBsorxJIDAKgAMB8
	NTSMs5lRFcvLLmrWkN9QPGoC/iLWQZCg5vxbghngY4GJrVx+qo0gS8Dy3ZripYyK
	0LNlWWx15nphWJ9OOzmyG8AjLAp1YTmBAEM0siUe07qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ha9ctk2e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:27 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso124016685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791997707; x=1792602507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQYG6p9/H5SkzSVfBEy5FmiFS3xl893haPgmkNoad14=;
        b=or+c5gIamyljDiOyxH93vFwlH1nrM+BZB+/X2PiTLGWBpIpHkQN+38MYf78lSwQvtK
         KUdfkG/GyfsJkRndfnDpLZ7Azrz31qdIxTMlLPXPbZyGVLy28M49b0orjB6W4fW8AP57
         +ZsqMWECpxT8dxMjXFXe54ukYbSD6GKgsfWEa6dDNjrY0dZHkK5Np0H3QluCf8rrh0pt
         iYGJvY2B1bGiAPdZkI3y/5ylamappJC38O+Ow3KK7xpB615c67Y3vBbyUIEJd+i0mkoE
         yRjL43ssJIbQC7aptKcCC2WTfFsJfoir/Sx2LmgG8mcFpfKOIDrDA+CELIMN11c/xYIm
         HkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997707; x=1792602507;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OQYG6p9/H5SkzSVfBEy5FmiFS3xl893haPgmkNoad14=;
        b=sdPXFgsOht4Dp+FtpKOjEOlr8loXwqVjkrystYAniuc4bw12sBAFR/DHOTrAaiO9xq
         T7/Aur294y/iJ5IkpnCarDIkJgwgh0+HJuHKBilOGKoT2PuwgfytaOKZ+YlHgm0Jmn8U
         MHO2hqvSeFB0pwZUaB9e64dlrDaYoGfcOadmDs0oiys1GhwYHiG1NxFahtDh0muUzLvF
         8OPLdaqPd18WQ7eJtQPQlnOTUQKKwLHkLOxCXbdi1jS75mW9onZaIuRqpEMFbwkwf3JL
         10/YsfglMh1qO8BxFhwzOfziD58hWnQhI7kQZdDbw6nDJ9KdQQOJxFM7IAhFySPLn2MM
         MMdA==
X-Forwarded-Encrypted: i=1; AKwUvBziBxKa/JHP0fdaol+EZm+Pan0S4rPm0+wVHuEzsO0GPQcOKYV1SMQYTnSP3xxJ70o5/VfYqFOQbbQODY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzSAVinE9IW6CdTSRkwiubECoCF9sPxRJQR6E/jWN2OF4+mzyO
	t5d58V8fGy4pbcN+1kWxYFVkTLKjN4COGBSVvyH01UoPh61pJboCIU5NSHO+SFwTwTqoGTGlCFR
	tedEVCuUNI5AeUIocSb+wr6tieeqTi0Fb2f5M09l/5Yn7VTr6VchGHjOiVTJp4g==
X-Gm-Gg: AYBFou3VGpHKha4If94iOkp3i8CNnQ6HP6nDDRsNZqsaZ8BLXaIhfy6ok4DPS+S1+Ky
	HDkl0j284IP5obLvVU6pgfErO8HBhpTWhZYMX6LOMuYw6pWr99XKyzdfHtVsoKEKCGdM1oqHZ7R
	36EUKkItlwTMxVEz/0L7wnY9ELD+crMe/IAeODW1CzzUGUlcdBE1eFHexBDvn7NEmzZjpArYaI+
	VQCYYeF1botTyuYx3BR/pqazUlFLmxvE7vZfj8coS8NGnZZan7T7SrIYPCRHaGSx+uRLxMTHG21
	JkUZ+u9c5jXqphF4e0tfb4Y9ZrpDT+Fa/mKN4fbcBqvhSS6wlp83C60xBibYTOM8onpU51WKB5t
	E/tEqKTCvi+d/zfr7ck4QFxNH4WG3+bfDi936FmdfjxxVW40=
X-Received: by 2002:a05:620a:2a10:b0:93e:c12c:9b71 with SMTP id af79cd13be357-93ec12c9ef0mr2595929385a.76.1791997706792;
        Wed, 14 Oct 2026 10:08:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2a10:b0:93e:c12c:9b71 with SMTP id af79cd13be357-93ec12c9ef0mr2595924185a.76.1791997706379;
        Wed, 14 Oct 2026 10:08:26 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-148.net.columbia.edu. [128.59.176.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9bda8643sm49190116d6.25.2026.10.14.10.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:08:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] mm: memcontrol: remove two unused helpers
Date: Wed, 14 Oct 2026 13:08:19 -0400
Message-Id: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO3z2oC/yXMUQrCMBCE4auUfXYhaUsQryI+pOnYrtgYso0Ip
 Xdv1McPZv6NFFmgdGk2yniLyitW2FNDYfZxAstYTa1pnTW25wVLmLjEohg5+TqY8UzIyqHv/Nk
 5wAye6j9l3OXza19vf2sZHgjrN0j7fgBGmuYZfQAAAA==
X-Change-ID: 20261014-memcg-unused-page-helpers-c43a866ee0ba
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791997705; l=474;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=18W50nwXyn7U9V9smq16pS1vshVmIOIZSXwkdv6O84U=;
 b=2aHeCLrlYlAv92xitm4F6gmPMcrkqJ1s19K+DNpvY47RTbxe5YJ+Y3C7BUgCYLBnYmZyOL5E8
 6o1NOqbqvThBeksuqYPHhAjtt0c+kANVTXW9anNm+a6Yw7hFwcwN4+Q
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: nWZ_qIkE8tgiXJVBpnUyFZgHk7kIuKsb
X-Proofpoint-ORIG-GUID: nWZ_qIkE8tgiXJVBpnUyFZgHk7kIuKsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX2sW2o56xdeLC
 sahhWSZ4AQyUU2Xf2v49h9tB3ALiUKR1eGYfplhvQwq1sKtEsD47Wu7JptciQfo32DrAV34Vbxi
 CetzZgA9zjC73UBRbBxlJJ18TQ9oZg80+zc1IX4RhPpBPyF7/oCWRNPlvqTRs3vnGIqYZ6L0TEe
 boEiG1hbEy3X+QcbQWMSVG+rn12ftJ/jSN8s7G9+14Miw56GRT8rEX0Ou9ohu+UrX5hiKjvGMps
 5Tcr3Kk3P0MJKXTfaS5z3eGT5bDe1nW3Fsk0iqnd3yMwuuWgOU0bIMz/81eBDkVPxIGzD20x5U5
 OS1Op0GfhX0MXJMzR2daI79Fp3kcr9ACXmPu+Im3xN6c8kQBAjDpvfz4XjrlASBlGWjWOISWuFk
 xsbRdGwzT9CvTUGJLCch6rERhBJ97p+LygK5LlW4mgbVHDs8rJOZl4jnRQ26dDTXB6kXUigsLWK
 1hCNR9wdJJmPqfoooSw==
X-Authority-Analysis: v=2.4 cv=FLCOVOos c=1 sm=1 tr=0 ts=6acfb70b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dxtdfZqDOO0kCslK4e47hQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=YtfsaVvi3jZCfUEAq8QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX+/riVcb6zXth
 sho7rmiOtF3WPCub+DqjfXpYc1VOPJnkx9cy5nj5pmOW2p9JRJM0PsS0YDtu+0uNjSlD9QBUXXH
 v1EcWeREGwmy6SvMsD0Elld30Qd/2LI3r2UROJUUXyQyLGIbfTRa
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=10 lowpriorityscore=10 impostorscore=10 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068

They were happily unused until I decided to disturb their peace.

---
Tal Zussman (2):
      mm: memcontrol: remove mod_memcg_page_state()
      mm: memcontrol: remove page_memcg_check()

 include/linux/memcontrol.h | 32 --------------------------------
 1 file changed, 32 deletions(-)
---
base-commit: ad9f2d463666c64e94b04be5263c9bf8f9f96fb7
change-id: 20261014-memcg-unused-page-helpers-c43a866ee0ba

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

