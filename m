Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18ED3AAF7D;
	Fri, 28 Aug 2026 05:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895065; cv=none; b=k1Bh1EJAsniY9YGjyiuqqaY12dAy+o+mgOIJq55x/6XOsh+7d1nmDVgDENVVOEh05q6HjoMMeoCn0Rv3VRoPh+yINyepHNUkQ+ZE4DZ9MlkFlGAuBaoIZkAEGZf8aVV/OCXYts/G5lyrK+VK+nvgu3xUlK9YfG5fRwHLV1O9qdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895065; c=relaxed/simple;
	bh=TtvVY7l8YQ3WqIRAh+HpirSrtKIVAdoh7UqKzmxt77k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3kpuBekN7KPaoQwEz4T7DE+76yCVIHi+y4bey7I5I2Bs0NLgBwLZRC9jbPk78BTikuFQsH0givZ+EqZC2a31+b1FC/w1mPebw3UiPZ2lHaMCeqYE3itS2FhdWtxUiwVoVQ1EZbINdwTIHszAkhT0vrlLen1hi/eeNqtWvQ2/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrH8e6hF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrH8e6hF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC7B1F00A3A;
	Fri, 28 Aug 2026 05:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787895063;
	bh=1ou94Vwt7CaalVQ6T5gB0CgvQCUhnP+aCD0rZ2TqFS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XrH8e6hFjS1pDqiNNQzAn8Nd+ktrZbkYU6z4BUO6QjnrSNbSCWcKMefC9BjMdxt51
	 OGHTJMHLUjMq4OMtMyYQjnGeaSlN/A9VQw3AQ6jrQIFJR5SJ/UeMTkFoGC8kYroTpa
	 1wzNAYnINMG1u0491Q+rtD5FgJ2DJtjWLuhre8XTSVadFCdIPoSB0cWkg3Ef6Fgjkz
	 ZG7aJnO55ioRKjyOJlWPyc/yB6VV2j6QYUVIIhd+IXOFWd+mA+rLWfmukjLm04Znfl
	 TggRHkvnWIfmE1u5s3Z035wfI9Pghu/6+dRL7YOK+K+5n/3Cvvs+Ce/OAB5xiEeeZf
	 I4uase0lRHMAw==
Date: Fri, 28 Aug 2026 05:31:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: bleung@chromium.org, tomhughes@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/chrome: cros_ec_proto: Fix deferred response
Message-ID: <apEdFK5rxLL1cXi2@google.com>
References: <20260827180511.2825660-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827180511.2825660-1-robbarnes@google.com>

On Thu, Aug 27, 2026 at 12:05:11PM -0600, Rob Barnes wrote:
> - Send patch using git-send-email via Google Mail Relay to prevent MTA line-wrapping (Tzung-Bi).

The patch can be applied via `git am` after the fixing.  However, KUnit test
emits errors after applying the patch:

$ ./tools/testing/kunit/kunit.py run \
        --arch=x86_64 \
        --kconfig_add CONFIG_CHROME_PLATFORMS=y \
        --kconfig_add CONFIG_CROS_EC=y \
        cros_ec*

> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
...
> +static void cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes(struct kunit *test)
> +{
> +	struct cros_ec_proto_test_priv *priv = test->priv;
> +	struct cros_ec_device *ec_dev = &priv->ec_dev;
> +	struct ec_xfer_mock *mock;
> +	u8 resp_data[4] = {0x11, 0x22, 0x33, 0x44};
> +	struct {
> +		struct cros_ec_command msg;
> +		u8 data[4];
> +	} buf;
> +	struct cros_ec_command *msg = &buf.msg;
> +	int ret;
> +
> +	memset(&buf, 0, sizeof(buf));
> +	msg->version = 1;
> +	msg->command = 0x1234;
> +	msg->outsize = 2;

It needs to set `ec_dev->max_request` before it can send the payload.  Given
the test doesn't verify the output payload, just removing the assignment of
`msg->outsize` and using default value 0 could be the simplest fix.
Otherwise:

    cros_ec_proto_test: request of size 2 is too big (max: 0)
       # cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes:
       Expected ret == 4, but
           ret == -90 (0xffffffffffffffa6)

> +	msg->insize = sizeof(buf.data);

Similar here, it needs to set `ec_dev->max_response` before it can receive
payload (cros_ec_cmd_xfer() clamps it).  Otherwise:

   # cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes:
   Expected msg->insize == sizeof(buf.data), but
       msg->insize == 0 (0x0)
       sizeof(buf.data) == 4 (0x4)

> +	ret = cros_ec_cmd_xfer(ec_dev, msg);
> +	KUNIT_EXPECT_EQ(test, ret, 4);
> +	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
> +	KUNIT_EXPECT_EQ(test, msg->command, 0x1234);
> +	KUNIT_EXPECT_EQ(test, msg->outsize, 2);

Following the above suggestion, this needs to be dropped.

> +static void cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes(struct kunit *test)
> +{
> +	struct cros_ec_proto_test_priv *priv = test->priv;
> +	struct cros_ec_device *ec_dev = &priv->ec_dev;
> +	struct ec_xfer_mock *mock;
> +	u8 resp_data[16];
> +	struct {
> +		struct cros_ec_command msg;
> +		u8 data[16];
> +	} buf;
> +	struct cros_ec_command *msg = &buf.msg;
> +	int ret, i;
> +
> +	for (i = 0; i < sizeof(resp_data); ++i)
> +		resp_data[i] = (u8)(i + 1);
> +
> +	memset(&buf, 0, sizeof(buf));
> +	msg->version = 0;
> +	msg->command = 0x5678;
> +	msg->insize = sizeof(buf.data);
> +
> +	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;

Same here:

    ec_dev->max_response = sizeof(buf.data);
