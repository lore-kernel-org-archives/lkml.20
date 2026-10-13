Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10344E325C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903232; cv=none; b=aRefKy7iEGMQE+lBmihPr7KzlskxnJbUHcp4wRbVkq26FCvmmQVpYXJudse1YdpQwYOtJhoA49793yazH6F1APc3td5nswmS9gmfn3PfV7m/nxHRI7MC1Vz7wLyiKVxGe891l0c+hbHpWOMThD+ItcmFmpcNOQttoRfSiaWkDdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903232; c=relaxed/simple;
	bh=W/Q6dOnZvYi9E9Mv6/PVFTMVdV+MfNQHtWRO9HwIX6o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KPBg6F3eZ6OVJLAPhBV50OZbSpLS7OPIlHjriMTjzVIsxuPlzoOlSlikoIb007BchiUZAdrz+jlH3w5DZWyYRxhjad2hf6Ow3t3L3VceaBcNXb94Mq0I9dgouMAnIN1LH7D4fvGV15jXT8RgbI9o1tbaC7lhX1fGOlqSo2Ftc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=T/YTUYjH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pHokbt07; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="T/YTUYjH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pHokbt07"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EBED87A01B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:53:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 13 Oct 2026 10:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791903225;
	 x=1791989625; bh=IqGUDxkJK/Ctx6Y9jMVypDVuJ2SPUzmMYvhwUQxto48=; b=
	T/YTUYjHPAsj+3O9tQSEYZ0oovefnCISsE99tHdBRgfvZIMI09+uedFJ53GUHigS
	cAPkFuW5uMqtOAnV7p2cg+jysE++lsmmZ2KMnX6hFjlSzsc3MmPDfMLIV9e4S7Xg
	VMkOQEjy8Q1V8WCTC4XJCFsg/WiSwzOrEw0gwBeF0SqzSH67eSu2tjkbvnhBmKiy
	MWz4LfhO/8rI2HzUoa4a5PmiJ8Cl3Upob9vJUWC+wMOzMsByGaQphzqyHgeXhbMd
	NryxmZUQ/pe6OmsiedviDzbGRg/CN6sBH1e3HrMpSLWBvPQDV7rdsbJyJKGP/gaS
	f42GzoNl63VcyJ8ufVhEUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791903225; x=
	1791989625; bh=IqGUDxkJK/Ctx6Y9jMVypDVuJ2SPUzmMYvhwUQxto48=; b=p
	Hokbt07NkeiStaTC7tMwK/S3o+ZRiN5onMZV69kOCxBNjcqoPvyujkT1ngYlbA8Q
	n+eUYOaMOHxdH1+U8SFO+hh5HVYqRR3UcTOzAqnC45UdMq/ZN+5kWqMtGPZJTPcs
	ZYlgU7H7m5WcsDcSbY/Y/HGKF2uEqJkXLt8CSuTJ1iPffUatXqLwIIJgekzEI5AI
	APvI6hJ5XZyKxijR8ZREF67/WteZ3tTzKRGbepFKq1TT9T4Dl93bXpSLlvY5uaSG
	x2ZAfK8NefEsuayQMFqIH1vvjl8TRc8gzbFIrUczYLLpkr8IwG6lV6L8TXzqXHSv
	tz8mtjHzKhSJssXgHh1Hg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791903225; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ZuF090UFkHM2R+rnMOBTK99MLk64KQ69hosXChj1/0cuJ84
	cWOwJG25xdBU7eVtM7Z+h4AsjnXKG3smtHiI5nrjDbok4i9gJ5LRiv3T/1rp+mUu
	tXW15ebj+NQU1FzcPb8xlI7w/idqi3HwDXeAFmqyDi4sL+W07VSuHfrHsqsLtWvb
	0NX5kpxXImNaL+5lKRwDrW5op6FwAvJZCeJcL7DDYbnezRB7e7Sbhg0ZQHs9t6GY
	Ik0JvS+Q3pIBC7S4JuhYHOugJ8Cw+z/KQJru1tfZx0JDmSjxdSB7SWdDt0u2Qx0p
	qZw1/ZfRB0Ua3ZRLd6y1zJhfey6YGUYClM6QJ0w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Nq4GWnDkta2MoPdmShiTmeNLhGp7xeath2FtNV66Nio=:W/Q6dOnZvYi9E9Mv6/PVFTMVdV+MfNQHtWRO9HwIX6o=;
X-ME-Sender: <xms:9kXOao5_AwoCAJPgRCTflHjP9DZ22-pxp600o70J_M8t3R-ijX0_4g>
    <xme:9kXOaku3jf4c-hL67eYCYsqdP3Otc6An5I8-l4fmEPxRJlngjKZjabWF1bLzf07Xi
    tDhbpes2T4GN7AFaV0QqTXg3R-_uEr1Vpk8oZ5C6RL3Cf6oui8efonXTA>
X-ME-Proxy-Cause: dmFkZTGaUJ3zbGnrOPZpOzd/IP+K0M72eNM826j+SoR+A/LV9dMLehrPwl9uzrHl5B6tWo
    FGpZdGxxutJaOFFdC9JMqM4TdwzgV81s5Cq5d3owtow4KJalTKGuLJFD5OjO3YKogaS00D
    kOJdju1cGLmF/ouJQBsMUiUo+2rujY+bMKq8i797Que4dXvvXco5FjPsTrUC212BDur+Mm
    MUn9xhlKBmnK4QgTyzv2tQN9kynMALqlaIaN8i6GQ4sOZPDww/0PfwIKWKUX/VyiVHopdW
    ug44LJH6zVe+l4VF2NKF09AHTewPdjaN8fAsu5JDdAejt3rHRf15KH0n8xjhhexdJL3yiW
    UkU0oV00Er716KqjaKiVFhgrsL4IxGk8YfChoOnR552MZHo6vTl7n9vCAcjKEr3cJmfUGP
    D3YuP94fiB4IOBSFvhZRiPjkN+kyB7YBnrn/HvDYOSeQaDM1D8CVIjcwuW7f3tOmXT1p05
    etE0cJMogqc9Tm8Lq4l6M+9uWoEtjxI7xidbVsxc/pFDq3y/o6AB24jBjbXcUY/P3KGlTk
    FjdPICQjl2Fo7G5YITGjF9ShZ6QVVDUjXHJsyHoC66N0XwH5NhD5nFIzpe+JY8hm734cW/
    DGBduuhV0zWu9ecBDU62ns7cbNL0F71ImV7WAB+v/By4feVcrWaUjZtEXusg
X-ME-Proxy: <xmx:90XOamxaL7MD1YAHGaon-TTZpbsD_QlDE8bn5R2yMSOFUljWWMENDw>
    <xmx:90XOai_2pWgrRp9Is_ZSMf7PflSlJzvU5PzSDviz_hbUn6gETIYueg>
    <xmx:90XOamjg4KY0XQNJNrndweESQ9HwPeY_yx5_AHxdDuFXV7bSUf2ymw>
    <xmx:90XOahFcinmFlk0DF6ffiweGLsaRBDcWebI8P0yJ6MNtyyNyf7ISPA>
    <xmx:-UXOav84Vkaxekz2MBVQvOMNGopqdjzUas4NjgKRrC7VbXnhOT0B4FU3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 704BE32A008F; Tue, 13 Oct 2026 10:53:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A_NvT-8FSIng
Date: Tue, 13 Oct 2026 16:53:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 "Marouene Boubakri" <marouene.boubakri@oss.nxp.com>
Message-Id: <522a2d28-2ac9-4a56-8a61-477be3dfbbd9@app.fastmail.com>
In-Reply-To: <20261002145140.GA784348@rayden>
References: <20261002145140.GA784348@rayden>
Subject: Re: [GIT PULL] OP-TEE update for v7.4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 16:51, Jens Wiklander wrote:
> for you to fetch changes up to ccd4b23398acaf2139cf04f1ba0a66150cbf2663:
>
>   tee: optee: build the Arm-specific code only on Arm (2026-10-02 
> 16:28:41 +0200)
>
> ----------------------------------------------------------------
> Build the OP-TEE driver's SMC and FF-A code only where supported
>
> ----------------------------------------------------------------
> Marouene Boubakri (1):
>       tee: optee: build the Arm-specific code only on Arm

I had a look at the contents and saw that it keeps the
IS_REACHABLE() checks that are notoriously error-prone.
E.g. this part just looks broken:

@@ -257,8 +266,12 @@ struct optee {
        const struct optee_ops *ops;
        struct tee_context *ctx;
        union {
+#ifdef CONFIG_HAVE_ARM_SMCCC
                struct optee_smc smc;
+#endif
+#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
                struct optee_ffa ffa;
+#endif
        };
        struct optee_shm_arg_cache shm_arg_cache;
        struct optee_call_queue call_queue;

The presence of the 'ffa' member in the union is conditional
on whether the driver that includes the header is a loadable
module or built-in, and this changes the entire structure
layout if both types of users are present.

The intention of the patch does make a lot of sense,
but as far as I can tell, only the Kconfig change is
actually required, while the added preprocessor checks
only make it harder to read and it should have been
sufficient to change the existing IS_REACHABLE() to
IS_ENABLED() for consistency.

Sorry I did not notice this one earlier as I was travelling,
but I think I can't pull this version, please respin.

      Arnd
