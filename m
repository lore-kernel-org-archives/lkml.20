Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB51448BB2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887145; cv=none; b=gNrYAWVhQ33xEbclrCbcDwo2x1BZgzHNlOgo2boSvtcUds21ndkgajovbHqJo/Zzgpw3P11QtVMIZYr8V/ZVpedo9k4oWAheo6gZMwGKbsQ5Q8WVCHM3EFA+mQZgpKaNPMsThrKQmfBcT4BmnPHE+hNL6UuG9Ds9bMrOw/Fb0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887145; c=relaxed/simple;
	bh=feQNw0txnkXooQ1R/g85T6gmCQHbtzMxRNiLzHhgesM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=F5iAcXi9xccbE+tWSrzlMLikK9hDKqynX+Q6xu7yXqbPqmCOzOimjZEXQGqHrEXRKpNObaKvYnROR5NFODhRs1ABLWGxJULbjqAEp03+cISw3mVZrYwz512khzbpBbop5c5mLR2wSjoxvt30hFG83efz5lbXqAhAUtPtDe9P4AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=c9oVF24C; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="c9oVF24C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791887137; bh=Xth8LYG8GlEls5IfYfAn2MKMXM/dfOwzL7ZTmtswkUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c9oVF24CYfRc1mMfw73e5H+NueSWacb6pym9KGU7AbdeypNbtfG5RNu8M+1ynbhzj
	 qHf8pQasEkIO6TA+gKB61y0O1bnkyonjUjA4ElZannXg14aj5Lue/TADHIG1JkmD+m
	 UrABjT3xthGBmZeU2b9+hVy+2kVvG47JTPQSw3YQ=
Received: from DiagonAlley ([120.253.195.162])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 5FBA9A3C; Tue, 13 Oct 2026 18:23:59 +0800
X-QQ-mid: xmsmtpt1791887041th7gxpvb1
Message-ID: <tencent_113ABD187DD2A0C99CB7D4003B81AB94DC07@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uWZFG49LXp9nBx/d9n3n8NQgnb6DekF7AZkKvcbBOun3jw3nbjN
	 8Vltjf9CPx+YVuArIRCADmyWffR0Zju7me4Rd+LUhT1XEcHdvM7qRCkHhrQfoYgJ7gHBL481kBZ1
	 nJly6njpT5voAaas5vMn4tOqcnv67fo4uIYxM3eiVjnaiAFFBQuR9aIlXZOE+qN2zLltM4Us61/c
	 1CUYw+jwSMc5CgkpFgmokATZFQzmLv6oBa6dFIAaZ0N00xO2MucdI+Fn9CROoBdxei418IdGZEft
	 XenLRFpmghdPpffPe3XJOzSZqLLVnWXxgA1cOub/MGQ9kx0nTD+kvWGeFeeuxs6WLn69BkdNsAOw
	 Fz5w8llFfRfBoKo7aw8CBDO1JRYb1jNxl4fG6iF0viLMtLhlD/gFVzyIDET2HMwttTvbjun6r5zx
	 06K2D7LDih8Dr2kewbCCOVXvseXPCqE+XptVMk0AaPEWMzPqPKWPvPrrBt5k6hkbOpjc4kN5xwaB
	 LmZpl4+kGndiUPcjsW2SiJziRxBQgcXd9n51P7UG1oHOyzj7bbJCu0uBoVzTh67qSpoNkoB5vrRu
	 RLMnfRe7u3vBeHG2upvgX1fmFUNBc5CeElp2tIHfsUSiHfPhK7HyJJYV2JghtX9AVE9pGj4xx9vI
	 fi4kU1wG4IJ1+tYSRmGu9gws0D1TNUvkBQRhYRApP7WPoU5dQOSBnmRYNXmFVg+extjYxqY3ud7l
	 TpaoFrCgSGoHhj+2ulwxhfklOchM047KiO2QZ+mryd+u770MEm+Mpg8xVt8hQ0Qz5LambWOkbfNa
	 74TcGXusuhbT7QCT7KBSpHtRpmrApqQwBCXI6FuSMxokn7SoaXpbVjUnJMrBo3tsNrBmhDNCtyP0
	 hDRqfLQDg6GrROAi8ouqZXr8Q/o/maNB9dqfqcgKTf0q0hHjBJGHGNiOHjyN0QZk40bVlWEVl+dk
	 Xrzi2FlXx4HMvQPKeSjR6JUYROugNWGkDq6ARreALkMRJ1NZ8P1qdtWLXqxdVVop93lX8tHTXVHL
	 cwuf8TfUk/mpNDVrm8mxSSy36K2yHeOex+iCyK8NAXiBTuZ9gIY0nUTRn24Cjv+4SPvNLNdlzY80
	 cf+m7Y
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Mingxuan Guo <gmx472@qq.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: cs_dsp: add a KUnit test for the cs_dsp_run() error path
Date: Tue, 13 Oct 2026 18:23:59 +0800
X-OQ-MSGID: <20261013102359.1711142-2-gmx472@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013102359.1711142-1-gmx472@qq.com>
References: <20261013102359.1711142-1-gmx472@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover the case where the post_run client hook fails: cs_dsp_run() must
return the error and the DSP must not be left marked as running, and a
subsequent run must be able to start it again.

The test fails without the previous patch and passes with it.  Full suite
run (UML, KUnit) on top of that patch:

  before:  Ran 5829 tests: passed: 5825, failed: 4
           (cs_dsp_test_run_error_clears_running in each of the four
            cs_dsp_callbacks_* suites)
  after:   Ran 5829 tests: passed: 5829

Signed-off-by: Mingxuan Guo <gmx472@qq.com>
---
 drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c b/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
--- a/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
@@ -36,6 +36,8 @@ struct cs_dsp_test_local {
 	int num_post_stop;
 	int num_watchdog_expired;
 
+	bool fail_post_run;
+
 	struct cs_dsp_coeff_ctl *passed_ctl[16];
 	struct cs_dsp *passed_dsp;
 };
@@ -106,6 +108,9 @@ static int cs_dsp_test_post_run_callback(struct cs_dsp *dsp)
 	local->passed_dsp = dsp;
 	local->num_post_run++;
 
+	if (local->fail_post_run)
+		return -EIO;
+
 	return 0;
 }
 
@@ -198,6 +203,33 @@ static void cs_dsp_test_run_stop_callbacks(struct kunit *test)
 	local->passed_dsp = NULL;
 }
 
+static void cs_dsp_test_run_error_clears_running(struct kunit *test)
+{
+	struct cs_dsp_test *priv = test->priv;
+	struct cs_dsp_test_local *local = priv->local;
+	struct firmware *wmfw;
+
+	wmfw = cs_dsp_mock_wmfw_get_firmware(local->wmfw_builder);
+
+	KUNIT_EXPECT_EQ(test,
+			cs_dsp_power_up(priv->dsp, wmfw, "wmfw", NULL, NULL, "misc"),
+			0);
+
+	/*
+	 * By the time the post_run hook runs, the core has been started.  A
+	 * failure there stops and disables the core again, so the DSP must not
+	 * be left looking like it is running.
+	 */
+	local->fail_post_run = true;
+	KUNIT_EXPECT_EQ(test, cs_dsp_run(priv->dsp), -EIO);
+	KUNIT_EXPECT_FALSE(test, priv->dsp->running);
+
+	/* and the next run must be able to start it again */
+	local->fail_post_run = false;
+	KUNIT_EXPECT_EQ(test, cs_dsp_run(priv->dsp), 0);
+	KUNIT_EXPECT_TRUE(test, priv->dsp->running);
+}
+
 static void cs_dsp_test_ctl_v1_callbacks(struct kunit *test)
 {
 	struct cs_dsp_test *priv = test->priv;
@@ -609,6 +641,7 @@ KUNIT_ARRAY_PARAM(cs_dsp_no_callbacks,
 
 static struct kunit_case cs_dsp_callbacks_adsp2_wmfwv1_test_cases[] = {
 	KUNIT_CASE_PARAM(cs_dsp_test_run_stop_callbacks, cs_dsp_callbacks_ops_gen_params),
+	KUNIT_CASE_PARAM(cs_dsp_test_run_error_clears_running, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_ctl_v1_callbacks, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_no_callbacks, cs_dsp_no_callbacks_gen_params),
 
@@ -617,6 +650,7 @@ static struct kunit_case cs_dsp_callbacks_adsp2_wmfwv1_test_cases[] = {
 
 static struct kunit_case cs_dsp_callbacks_adsp2_wmfwv2_test_cases[] = {
 	KUNIT_CASE_PARAM(cs_dsp_test_run_stop_callbacks, cs_dsp_callbacks_ops_gen_params),
+	KUNIT_CASE_PARAM(cs_dsp_test_run_error_clears_running, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_ctl_v2_callbacks, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_no_callbacks, cs_dsp_no_callbacks_gen_params),
 
@@ -625,6 +659,7 @@ static struct kunit_case cs_dsp_callbacks_adsp2_wmfwv2_test_cases[] = {
 
 static struct kunit_case cs_dsp_callbacks_halo_test_cases[] = {
 	KUNIT_CASE_PARAM(cs_dsp_test_run_stop_callbacks, cs_dsp_callbacks_ops_gen_params),
+	KUNIT_CASE_PARAM(cs_dsp_test_run_error_clears_running, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_ctl_v2_callbacks, cs_dsp_callbacks_ops_gen_params),
 	KUNIT_CASE_PARAM(cs_dsp_test_no_callbacks, cs_dsp_no_callbacks_gen_params),
 

