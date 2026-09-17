Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660944AB62
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637705; cv=none; b=ma9txTaCn1qXJyk3lFRGmQIf9fppYc0wx90BcRGHi9VWuw7FJ+vI6XVHs54G2M36nMCXO1yXQ/5/8mh4EKEh6wl5V6p/L6+Mru+cd4OFccyAbZEvhwcfQEGTAjTAoktyqJ9WwAHSFMMzCMlP9VQAQV3rFXpluOeG5mXCVgqs8Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637705; c=relaxed/simple;
	bh=U18JvJlreGZyY12ZpRMXUzcuuBGhGVLha0N6/E1/I5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixGaCPbCm05BNAmCvE2UDpfEYe9P5Ak7bOsNNZp1pN3nXQ8NRUp7Qb+wguqKfAyx5PesLCQNDoteltbupoOyYZkoLy2ra+Z05PmpwNKf9u2isYloP/xj4JGV7W+x99Djwkri/oNaoduoDi1Ls+U1gJgg/BbNKlcNJOmAW1kOrhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWGOgJQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAmhD45W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWGOgJQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAmhD45W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H8TVC4597684
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYug
	kZhJgZhk=; b=TWGOgJQFUmLaEGoH+rkRgIEi2RXq9TZ0ej91zqmN+xUkftVxtNp
	Pws/ErTsWOyr/rv7VW7nudXGsLNthuXwAowIbiMtL75lh6kq0eSFppRYE6UBfIhf
	CwDEdFKs6wSv2jGRPbBKidGQVnuvPbGgRMzqZ0FjTltHpkmZEVoMy4pCSs3PzbiO
	xyRHpyU76CuWtYf+3AS4YD+SeB/euOb7FFqvl49nTYNnCQE3Bwc9d5G/ScDp13S/
	JJ3uaxRh6MGhYhoBG9YYWlEnXwEKmVwor0jumECF82ozzNhpxlpRMuSAKjzbl4+E
	nycHxQljK7d83wiIbTVcvHep4MI9M8O64yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra88ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:34:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so116474985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637688; x=1790242488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYugkZhJgZhk=;
        b=RAmhD45Wps5Bq3f/iM9irngiiXbYKhSdD3ajsZzK5kSOzzq4h6wpiuw/jfqDgSx2Y1
         JxrLao//Jwpo5MzF0QNZ+I+5W+DPR59xUdBZRTbuRUU9umzLpge/F8x/f/vEyBq1ff0F
         mWCdVbxamyAqL7w9BTOqFFohNYjG518HhL9ATaU1j+bUtXt2J8VBggMG26q1hIn5wHEE
         jzskFMhpFqepm3JNapXN3bkfAs+uAUBez2hVT9bxRLdxe9v5xcSBnKl0DIBP9k/ckfzC
         RKogYnbbQmUVeVMPa9ynhrZ5C8ENvrPd3t45ZhjtBWhuKqpUFw4IUsyhTH58OpIWBx/1
         feIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637688; x=1790242488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGegAhrHwlHP92QZ0hz4XHBiZPTgOX1xYugkZhJgZhk=;
        b=bHhk+kNqUexojgxBlZHSHmoM78Fwi5PTwYEsLPpD7pklxrBBiEcAMSBjDz+MOzgFah
         HdkMi9l17tsgaD+BPBcREDtzdRugDjgO8oV/vixysmH6T7Xw77a+75uVRcFHLs8E23Lq
         5lQ+kmwcYOnNhgj2ihrxm/RF6nDl4TKtTS+YwjeqCR3yxlASeI34/Tyi/IeV+5AxFsyM
         hUx8081MPM35pXohg3Xk0EsX9yu8/HZtoKAzeBT5jAyfybjAjExgunEtVhqG+s3T8QK7
         +zhtG0vQ8sPDAmfx76+mKoY1a0oDynsKbkZFfVvctjG0tBw3c/IjdSfqtA9XCPzEwcnR
         Whiw==
X-Forwarded-Encrypted: i=1; AKwUvBzKBsxmfhMV6Y2cKQjclkc5vYJ9L7OfOFAl3o1mYSRJS7MI+ZbkzHhB9nITvOi6QsgUt6i76Ed03uaikh0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUlGh6HYlB/r+GMjzJ9kNOA5LKZdpVFSKo2GMLA/thSHRFu9TG
	VEC1MrDq8VyA9JGOAQyjxfkzBQG4o6h6qb8B2kgfRawdaXnjRfMRFAKeYO4Br53VhJzP+Ur+nLI
	Pb8to+1hRC3+hcYC07IYAxiWgHq6vFZoPfDpOTxxMCQVkWgLyasUyjdjLaY+60arhloo=
X-Gm-Gg: AYBFou2uFmXWWF8aUrvAL5QnKVEAsio2kVMTbVIfeMc3BsHiMASWeXvvcdKG7VDsopQ
	F6etIlun6fbs8gX9WpE8mYzeAcIHmUZckGF7mi0zEH8aNNwQi0QD9pZ2lfUZgTkAhxeRFF3IrTL
	4yn1f5csB7duS+1mfbW9zseUKlVZzJgCV99tpg+krGKdXK4xcZqbXtPCodP1HbnfHFSRcZviogL
	s+7WmRG1Q7uUKoXNrr0Fcj25nPgerjpdM/LTau4vYS4E/trY86T1ipO0SjJHte+iBhpxRknLeeq
	QyjzPNPa2Wss9D5fYVink0sDiXb7g9qyNxpFoEIHtNl05MztZH0qR7T54/V77uSXjkMM5jgVpyl
	MAQaTC1MWNO46XMDiTQKVVIqXuOg=
X-Received: by 2002:a05:620a:6cca:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93bb7667fcemr1037211185a.5.1789637688104;
        Thu, 17 Sep 2026 02:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6cca:b0:939:5ab4:e6ab with SMTP id af79cd13be357-93bb7667fcemr1037208885a.5.1789637687747;
        Thu, 17 Sep 2026 02:34:47 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm71157115e9.3.2026.09.17.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:34:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:34:41 +0200
Message-ID: <20260917093442.6439-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX6oSfQzqBowEA
 5DrDz/XLv4dX6pxU9z7r4dBu5U7a+fs0SKxEP8GISdWMvt6jZou8D/ZRnLo4o86GIQXk1ZZgiv0
 Xe1+6WRKQupcgUMyncvmeOyxXgXUB0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMCBTYWx0ZWRfX+bCAkyWNNxgX
 2bpk6evubbHQm8G9ug+/ByiV2zNak0B7d9TOB/efXdKusOzfSNfQ6pyQqbKZnGhXr/nBoR9BeIN
 hvyt4pemJOXs2BZqWWtisSXCr1eG9wEeUtH22X+GrFOiUpv4UQcU3d6lNUDGTQN/ZEGa085DXHq
 jClj4DfMXR9NNcG6PlCI5+SFyfhOmp9GcD+I8pKvOZf9s6hoBSVwZAErrhJ9mW1jpmUS7iWzzyt
 kTUgkI45PebGItg/h5we0bz4V5XKAXTsYg3YoyJ5iYyj/Oc9YyLJMSRUioF5NfyUz+Sf/cLi+w7
 PAfxdgX5fshhgF6kVeqhDku0tldNwg9e8Gp3y8ICC7saZrHL88cVC9E2clLhz2NoAvkbNZ3ba/+
 eZJ0qMztRzAi/2lzUMBSRr3RDsZdVID/sBR8u80H4BsFcizOM786zh4Cz/D4A44nmEblfPxyl4g
 TCAtNRDUnZunJEnluKw==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabb439 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=P-X_zlnOR8CFjOU9GSIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Fx5UErCC9Iwbss5CXthfj_V92uVorx4H
X-Proofpoint-ORIG-GUID: Fx5UErCC9Iwbss5CXthfj_V92uVorx4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170130

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.3-rc4

for you to fetch changes up to 50fd0ada8d37587223001600933270b59cb30e19:

  gpio: virtuser: skip free_irq when no IRQ is installed (2026-09-14 10:51:01 +0200)

----------------------------------------------------------------
gpio fixes for v7.3-rc4

- fix fwnode reference leak on failure in shared GPIO handling
- fix regression in OF_POPULATED logic after the unification of GPIO hog
  handling between OF, ACPI and machine variants
- don't call free_irq() if no IRQ is installed in gpio-virtuser

----------------------------------------------------------------
Abdurrahman Hussain (1):
      gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found

Bartosz Golaszewski (1):
      Merge tag 'v7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Michail Tatas (1):
      gpiolib: Put fwnode reference on failure

Runyu Xiao (1):
      gpio: virtuser: skip free_irq when no IRQ is installed

 drivers/gpio/gpio-virtuser.c  | 3 ++-
 drivers/gpio/gpiolib-of.c     | 6 +++---
 drivers/gpio/gpiolib-shared.c | 9 ++++++---
 3 files changed, 11 insertions(+), 7 deletions(-)
