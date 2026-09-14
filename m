Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE5533D6D5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372142; cv=none; b=Hj5r95gXfnY/07NpUJwkInhyb+6Lx3fh4oOLoXB89BYDs1CYKmEhuDtj9X22DBwiaOZvCT6mc4Oy1FVbHHT52THbyPwgarw/1zIdqi3xOEj0WIpIsKAugFxi3d7NHkWYlCJneAqJePMl5tFbwIW0V4dhqf3fSVOSBObhE/s5QO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372142; c=relaxed/simple;
	bh=TMa+OM5r+Vw1Fyw2b/6glfXwF+0n+Fc54o83E3UwZhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XtJ/5IyzUNR5acMJCL1ScjyRzafLWhHdvGbSTAB0cUuUrAT63L2paDuX1gD/ItbSj+dZdZnQ4XqyvrSkYjudhz9J9zNxNuI+4AQ/SV3A96IxGhPzXlnKlremrCurNeNjZJgfFQ4/qMEc4ecm9q23dQOihv5TQIqhJ8iPLzCm9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz11t1789372072td29db936
X-QQ-Originating-IP: a25r7OdHgSwUV56NjAw63Rnel8ssIsZih28fCd7k0+g=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 15:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12824370477255619033
EX-QQ-RecipientCnt: 10
From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dengyingchao@kylinsec.com.cn,
	qinyungao@kylinsec.com.cn
Subject: [PATCH v2 0/1] coresight: syscfg: fix deadlock on device registration failure
Date: Mon, 14 Sep 2026 15:45:24 +0800
Message-ID: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MOL6Ei/hP4VXag/PsoZ/x9ylEMqNy2KV/bQRQPx1eRU4QGhXZFYqsifn
	HN+ICQeqUZunzZzBdi+yM08xvIb5997GOUb1EZCri8vU8hcMvJae9OB55w12FZKzypnTH4o
	KQrGFTudbdPJYqTlW4uIeUMbs3z+MuLoZlKZj/Mo/paJX/889uXWuw+y9f8+zbbuqKDhATB
	9KesZ9FBhlSGYsH3lL6vBVCZtdxiEPM+/S1kKI6zA0Gba9X3CZO1OJV50FiRzvwdhkYzEE2
	FrGf7I7c+eSZQfq7WZNYPldgUkG0oHg+GHIixIhfTxJzckf7PqJJtn0KU1/9tV7mSqc3S/J
	ck+BUJh9M+PU6JuTE2JLc0y0iHD211uXMqPGIOE0mNi50rk2nkgs/dizx0vo58Ezxdhp44s
	vdqlpTOwEzP6G1LYBvaKtdxURWL4e7no5axlhWvq5X7H61Kcm6R/bfye/Q/kTtBs+gOXXhM
	Rc+bHH4Qb37j52/cl+25mglJpos4dduqhb7cE+9XCUM0uxGtJs10gdxcjG0N1cFE8gw6nDn
	g5JO/NMn4MeLcooVs7UClwvNKucalB76+/KEfl+QsLb/eNHwbBZt8wYl0PbmW5EAoCr6z4d
	MYKYJ9gcpkEbI4YW3uvwi0gSVPMg56zWNuOm4lqOoL9COCcGgh+Kghrnc8D42a+C3EWj3iR
	pettlIH1u5KADA9tcUesXu49jvJr/3Bap9meWhMXpCcPyGUVMJQaRal5MLoJEe3GzwiJoeP
	wyi0YY2OJUm0Rr3qxD4Kmia2BvGB7PV6/ebRvsoSvuFpnPegH4qi9FI6YF9rRQHk7WfOX6M
	x9klzb+xU7pakxB2zAmDd47EW1IZZnORHdKo+hN7U1sPX4V83czjHXyYPzzeFgdxH2zR8OQ
	RQcTn8wFaYrEP7k1sw4wHgOJlqdTlDFmG1Ez51dpszYyQdXg/SP9IfxFuYRfEIFKZHOMrtC
	opDbpYZSX/2VX0cEwqdDtFvXTmP4bWs91i4QqiQF1jAsIUJucOUo7C0bgbOGA+XPBkvmLyI
	QYvsdESRggpw8TCxDbvJCv6Bjfyb/cg+aNYqxOnXa+LjluY1XXe1ykwubK3Zw4UEPZM+IaZ
	3HdBU/vPSPYgV5sXRAaAOWQ3Utzmj6llKZ7Seb1mzo0nRFrpQXoMmHQ40xHeY+XdJAfAmU0
	BeQcut3PbZk7ajduwznVoKa4wEXvijK55Dgsm4O5HW6P1fVGqUvv1umsSDApn5S86kdT
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

cscfg_create_device() calls put_device() on the error path while holding
cscfg_mutex.  If device_register() fails, put_device() drops the last
reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
deadlocking.  This removes the unnecessary mutex from cscfg_dev_release().

Changes in v2:
- Per Leo Yan's suggestion, instead of unlocking before put_device(),
  remove the unnecessary mutex from cscfg_dev_release() and take it
  only around cscfg_mgr field initialization.
- Links to v1: https://lore.kernel.org/all/604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn/

Yingchao Deng (1):
  coresight: syscfg: fix deadlock on device registration failure

 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)
--
2.33.0
