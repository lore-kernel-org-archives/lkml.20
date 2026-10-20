Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460932;
	b=FMk4HJilHCS/WD6ASAji3rllfygTbxSUygu4DLDzdL53nrfuHhOln52/Hl14uiE1qQu0
	 +ZRzPecEtLudSJ45CTU0s/stNYkYgtL7qajPNGDo7qHvT/gNcvMn0oVga4HX4JaeBAIow
	 WiS2x4Ip6w1ThwQk9RHX3H7BWKz9+RWSIfUmnocCr580DsLHqUnx6LubkM7VJ6EwGh2c4
	 BJzYRMJv65gipaLif7z4fvVY1m6U6bezNA8TmvR7IhRz61sz8Nlj9B/j31rYlC6keEr9i
	 vJdb1sJeWAtFMNy2l54YXbh0IPQtpzuR4oXrkjyhrYk9jpzRpgua4nUccUnFZYDRfMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460932;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xYUTNMkW2csshCK8Ys4wXnh9fdTf3ASbUgcj9fONDe0=;
	b=WSBf7H3BK5ST2FzLsYcb9usuplcXdLGKXSL0rWaiIDW08kblpcojlJAfobcq6/BRXZaB
	 6mGomso/Y3oygZSBNBGojeLkv6fvR86AXGnvPLXKXj8GCd76rA+N4FxLoWPKQzy1tHV6D
	 BI9QHGiWRcVBJIkIME93QAmNq6kEMG7WTj3728pnOb+hddTFprpp/0OFZyl8kE4xU9bOx
	 YHTs9C954SWHGqNL3yGLVM9ja+Et6Wve5IW4s0nudk65wBQmFjjETGDHQ4Z3KdslerqAy
	 ZByymBKAXMGsvN8mAyFVe3/30H6UKxfQ0jnDJKXbfk26wfPeDRIT+st563idU5U6f5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OJYZ8vo1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6151F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6151F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OJYZ8vo1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792460929;
	bh=b8dt7ILauLndGVgIEIvkXYvCIjmzfLH15k6esv+BlNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OJYZ8vo1r0xPuFH2vN/yTI3PXQrEXGJep0Zyzf8eKFVON/fPUVUh+sbdsH83cDPS8
	 tOoGQcXvv0bcuP9uDn0T94v3lOOSgwCg+3etg0tEd32V1m7X7ytr0XXEUOqQZIVPr/
	 KwH64gTgXyMzJLnkjzlWIlyjOh92VPX6jKxKNmWTNMykgjYgYQ0vxXRPvGhjMykitM
	 YdvhHEQ4jNC4FPRSo76wK+NtYA19yxQBAXu3g1uj5hP+hWG5MqQJQuP8CXdHcAngQX
	 Zk6oD5inHod2EZ4d2YvyFO+qqHtx8b6V6UqwLwAqX5D4PQBrovXxQuvd6ZCaAt/uSH
	 zZ8L31OMdGwoQ==
Received: from [100.64.0.157] (unknown [100.64.0.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF68117E0382;
	Tue, 20 Oct 2026 03:48:46 +0200 (CEST)
Message-ID: <533a80fb-86db-46a2-a627-7db37bd8cbb7@collabora.com>
Date: Tue, 20 Oct 2026 07:18:44 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: Add CI pipeline for drm-misc branches
To: Maxime Ripard <mripard@kernel.org>
Cc: Helen Koike <helen.fornazier@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
References: <20260911-drm-drm-misc-ci-v2-1-1847f89585cb@kernel.org>
 <9e1fc5c6-53ff-4a4d-9744-77bcf6a0325e@collabora.com> <atYoMnjtOhDLJwza@houat>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <atYoMnjtOhDLJwza@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 19/10/26 19:56, Maxime Ripard wrote:
> Hi Vignesh,
> 
> On Mon, Oct 19, 2026 at 03:30:54PM +0530, Vignesh Raman wrote:
>> Hi,
>>
>> On 11/09/26 17:48, Maxime Ripard wrote:
>>> The DRM CI infrastructure builds upon Mesa's CI to run IGT tests on
>>> hardware. Its focus is on functional testing on a selected number of
>>> targets.
>>>
>>> The concern for drm-misc is different: it merges a large number of
>>> patches across many platforms, and build or unit test breakages happen
>>> on a regular basis. Adding build and unit testing for drm-misc has been
>>> on the back of our minds, and a first attempt was made last year. The
>>> feedback was to rely more on the existing infrastructure.
>>>
>>> Introduce a CI entry point that runs on pushes to drm-misc-next,
>>> drm-misc-fixes, and drm-misc-next-fixes. It reuses kunit.yml,
>>> check-devicetrees.yml, and the freedesktop ci-templates, while defining
>>> build templates inline to avoid pulling in the Mesa pipeline.
>>>
>>> A single Debian container with LLVM handles cross-compilation to all
>>> three architectures. The pipeline compiles the kernel using defconfigs
>>> from the drm/tip rerere-cache branch, runs the DRM KUnit tests, and
>>> checks device tree bindings.
>>>
>>> Link: https://lore.kernel.org/all/20250319-greedy-sturgeon-from-avalon-ac758f@houat/
>>> Acked-by: Vignesh Raman <vignesh.raman@collabora.com>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>> Changes in v2:
>>> - Run dt_bindings_check
>>> - Run on push instead of MR after some discussions with Dave and Sima
>>> - Test run here: https://gitlab.freedesktop.org/mripard/kernel/-/pipelines/1744733
>>> - Link to v1: https://lore.kernel.org/r/20260902-drm-drm-misc-ci-v1-1-49d05e228eab@kernel.org
>>
>> Acked-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> Thanks for the review, see below
> 
>>> ---
>>>    drivers/gpu/drm/ci/drm-misc-ci.yml | 147 +++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 147 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ci/drm-misc-ci.yml b/drivers/gpu/drm/ci/drm-misc-ci.yml
>>> new file mode 100644
>>> index 000000000000..4ab87547794e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ci/drm-misc-ci.yml
>>> @@ -0,0 +1,147 @@
>>> +# CI pipeline for drm-misc-next, drm-misc-fixes, and drm-misc-next-fixes.
>>> +#
>>> +# Runs on pushes to drm-misc-next, drm-misc-fixes, and
>>> +# drm-misc-next-fixes. Compiles the kernel for arm, arm64, and
>>> +# x86_64, runs the DRM KUnit tests, and checks device tree bindings.
>>> +#
>>> +# A single container image is built using freedesktop ci-templates with
>>> +# the packages needed for kernel compilation and LLVM for
>>> +# cross-compilation. QEMU is installed at runtime by the KUnit jobs.
>>> +#
>>> +# check-devicetrees.yml and kunit.yml are included directly. build.yml
>>> +# and the Mesa container/build pipelines are not:
>>> +# they pull in hundreds of Mesa-specific jobs and templates that would
>>> +# each need to be individually stubbed or disabled. The build templates
>>> +# (.build:arm32, .build:arm64, .build:x86_64) are defined inline.
>>> +
>>> +variables:
>>> +  CI_TEMPLATES_COMMIT: &ci-templates-commit aec7a6ce7bb38902c70641526f6611e27141784a
>>> +  # Project whose container registry stores the built images
>>> +  FDO_UPSTREAM_REPO: mripard/kernel
>>> +  KERNEL_BUILD_CONTAINER_TAG: "2026-09-11-01"
>>> +  LLVM_VERSION: "19"
> 
> I just realised there's still my personal repo being used as the
> container registry. Are you ok if I change it to drm/misc/kernel when
> applying?


Yes, please change it when applying. Thanks.

Regards,
Vignesh

> 
> Thanks again,
> Maxime

