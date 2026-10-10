Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E30E1A9FBD;
	Sat, 10 Oct 2026 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791592267; cv=none; b=baQd8fkpyNNmFOr/b1v46ypoPz1owbfEarzSeRE13Bae05YFU8Am/6YYGiY2iBIo1rETA9BqgLct9QOyXPIvzcgIVj3OIOAC+KY2XzImFWvK1qB+Yap9b7Q+ed5HIXYXnd7aI+yw0eBmrMYzAHnSskeumifXMI1SY/Z/skPLMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791592267; c=relaxed/simple;
	bh=DnJ5agdB9vylUDOAtxt0wtlXcTlPAsAj0ZPjo9yP0KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2uCmf9Uwxnixm5OOIJMXvHNtxnUvvmd8UGdYEUfd8AHDQHHNZ0UOdd262eIbKs1pVX7FieHuMqi3ch6hW4vwUZ9sDBhvPGCLSKKehY7yHOohnlV6I8ucVwX9DMi6YWevSN7tE2l6mPhP5hyg0dwBUS8CC1kl2+5W7NARMPoXUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z47dp32R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z47dp32R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACF31F000FF;
	Sat, 10 Oct 2026 00:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791592266;
	bh=qKwvY1uDh5KZjpZkVgcqjKIeuLsMfTL7RpOBSrmLXlc=;
	h=Date:From:To:Cc:Subject;
	b=Z47dp32ReACiFnJbrG4tiuJ1kBeTmF6RNFmVcMaj/5RYGJQHVnSQPV5YqbHQi+96S
	 dsIOdmQUFdK8ipLjSyp7auVCuglu8w7Mqwq+ggY6LaeXUZ6G/91nriNKhBGup99aBv
	 MKvmwkhZ1yVgXrBwzCRR3j4jzqClA12Q1HOgbome59Bffj8i9a8sqg98rScf8R6Vy0
	 cIRMH2GxNvQgHJmuxYdzUacFhEOP8CY6H+mmdzkmDjyFhTK2mxruDFbEBVLmKvE320
	 bhCEh8ScbxzCOc+IT8vl0VtqdL0oJt6ZV5DBg/x8w5tI+RHnDYm2pYIp4vaAo6Gl/Q
	 ZLhyXuht2G+HQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6598F1AC57D0; Sat, 10 Oct 2026 01:31:03 +0100 (BST)
Date: Sat, 10 Oct 2026 01:31:03 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: test failure after merge of the landlock tree
Message-ID: <asmHRyx_uDkK-tJs@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the landlock tree, today's linux-next arm64 kunit failed
like this:

[00:12:55] ============================================================
[00:12:55] ================ landlock_cap (5 subtests) =================
[00:12:55] # test_cap_to_bit_invalid: EXPECTATION FAILED at security/landlock/cap.c:113
[00:12:55] Expected kunit_suppressed_warning_count(__kunit_suppress) == 1, but
[00:12:55]     kunit_suppressed_warning_count(__kunit_suppress) == 2 (0x2)
[00:12:55] [FAILED] test_cap_to_bit_invalid
[00:12:55]     # module: landlock
[00:12:55] # landlock_cap: pass:4 fail:1 skip:0 total:5
[00:12:55] # Totals: pass:4 fail:1 skip:0 total:5
[00:12:55] ================== [FAILED] landlock_cap ===================
[00:12:55] ============================================================

Caused by commit

   b6a56b30b9d5a (landlock: Enforce capability restrictions)

Due to the prior build failures I have merged the version from
next-20261001 instead.
