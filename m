Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145599;
	b=GRs0wiBfTmsPQF5n/jOb8/o6dEFbDh04SVMwyfG+G42It3PbtcXDzEYPfXi+xbGYEYnB
	 n0Sv+5ycwqTu5TRNmBKgf4CK/26lGO9ehJBCzKpo77XiwT9Hoi4obu/7DChyv5zAiF8kQ
	 9BJUiRbRjZzpCDeTMoPceMioTcebxn+owdR6X2yXN6bbfxOq+eUF1f9GMfYBVxEjV5Cl0
	 ZDIrppp4SfEVUQ/W4/uOqZ5QWbsR3uQz/9j4SUbPeOuyH0gXJeYi5PKTa84j7newKGwOD
	 l2zuwLKzY2vmDtOQl91GElIW3xzfUlR/hM9UzgUkIUQYkVX/jtbvO4DO5fEBBveFcKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bBTKol9N1nqETGHQsxayqsr3cv18S0UQTtkfWd81H5E=;
	b=vBN7dEPz/MVWaOuEEGg4cNg8FUdpCqhT4LAZEpW5zpsG1FIttAJ1ccN1duSk5PKPRlgt
	 aTcuaLscb+dlIFqtWA0r9DA5TLxijoE5HRoWvUJjwAPZ77ycwJqXkGfw8uPbyzGdmDrgQ
	 maDOue3PXqRWi+HDGcgMAVrJy2s9P/lbwPy/nqRS+dOrR6AVtfIuh+ag/NVSbQHPNxGeF
	 z3J8iNCq9RepSuZA6WWzFWdw3Fu6IMuIDdrTh46XZCw5lx/JSCMIm2f3e7YZOCzFQeZrL
	 pVnajF4gtUxZ1Qof2Kdx3PIN+iLuEnIM8tLVw83CB2p2ACyhyWEymwkT64GAge7rKdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jw7zuv1g;
	arc=none smtp.remote-ip=209.85.221.67
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC8606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jw7zuv1g
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1131308f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793145597; x=1793750397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBTKol9N1nqETGHQsxayqsr3cv18S0UQTtkfWd81H5E=;
        b=jw7zuv1gx34Le9bdwkPfAzA0WcrP4z8ooC4p3a7cQYc/9DKAC+1c+GJynoSa9AuHc5
         pqlsdwLZqEF+1sp3C/SrnSIXvGgQhdAlHvYxGnAqOXt+fVqFlNvFKcp8/ZtF3IRpgn4b
         yhuxNg8Grlp+GpQPKpYT7iA0C3pOwtt5JJzagDoBISJOR4x/uDYo341Jmui3ZE5ybFwW
         ycT0H+eQgtCMMDS+vSlpWsMVAeWnpre5QlAdwSndpUNkuRgZiX67KgD3MEvXbBccnvo5
         tGcYQAXe1jHJp2pnvOCLR56f1GlFjjgCfTvkBs00xiukV1Kr3k4vhYnui34HmUHEGlHJ
         zyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793145597; x=1793750397;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBTKol9N1nqETGHQsxayqsr3cv18S0UQTtkfWd81H5E=;
        b=jy7It00PBDq35E7Y3TC7dDnjUcY9yRCmIZt0t7RTNmVSSL9IN0c+O1NW4Ag9WJB6dz
         NJyxK5KGztO9WBmR52s6tCRlcifLYzUlqr+TH2wyNPUYiQEJctzkdoyQEmNIDbICD3+f
         dRE76bEnDCeBOQT6pQsX8Fwn9muTVHiWfhKoGQOwAXukuzMdZQ+ZDjGjspwLyDewRTSs
         HOcLltZOTUAawi+6pn0vRh66rQ/BZ5iz/EYQqJA9jF0Jhi2pfl9eeUy5cjxU+F9FlbHT
         UE2e+BMziKZPq/UDQmT964uLgtbOMm6wsuj7x9ZcsdYkh7IJLgx8HPcurJvSgLoDqQgR
         wbrg==
X-Forwarded-Encrypted: i=1; AKwUvBzYIY4H71OUczoQ0RCsso20Gn4Lz0yvTL7H/e0KQQU3GbsqB28LXiFlM33z1wDCOpcuPbzZymuBGvCeYvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLayWGA3ilOE7Yziyf/3e4Km+bcorF2b7YDIfSV9j8ceNQYS6f
	6Ir1eMZAwmW5Z8mwicuOmNSCf6QBB0Adu0gsq5IV5Z/oKD8SRZZDtebd
X-Gm-Gg: AYBFou3/bif6cxYeKsmEf2vzKO3j78/JTmO/mmc3zW+hUmoVRqfnLWKduD3ouG14bnS
	qdrL7MjaCzele0kuak2JSN9ZR9UpNgVl/cqOwj2wcOmHgjriIk4a3D5VGD++BvwqrMoVhZF961K
	hEffCgh1fenvotiQnIAOf4i1sKNK/2S4dPXbKpEfU3ThxTX96z5rl2EmgWo2APk4l5MOY/t/mqk
	xDxKv8mQHceNWmepaF7/k4ZIqsA3QQixEeVu3wh4RbpNfltHnF5cM4EUm6fn4F4M68h6f/fJK8w
	ZQe46kLsWbZ3zGbvvRtfyY3/tkyH5kQ2mNEOlgLHFfm8DelvnMqVzk4n8yqMKJe5SV9XHXz7/zG
	yTrQxQODtCdFeuaNb7ngM2hQ8PC8kus3va2fg+dZD5x9frofhISRUcrIs9wiv6KnS3sZEju0NU6
	0FUewn8+xnplxXA4qx9DY3B9X+CExXRq0WnML1uh5mRkjzyJwni4yIU9gp9b2gArGrzYzGLqmTF
	105QGszGLfhjZrcx6yd5LhBO8eeb/bewsUfDcrL3u+2oYnl
X-Received: by 2002:adf:ebcd:0:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e55a5a8bemr6497483f8f.29.1793145596732;
        Tue, 27 Oct 2026 16:59:56 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm23200698f8f.37.2026.10.27.16.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 16:59:55 -0700 (PDT)
Message-ID: <138497f6-2271-4229-87f1-4e42e9d2b581@gmail.com>
Date: Tue, 27 Oct 2026 23:59:53 +0000
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
Subject: Re: [PATCH 1/3] drm/amdgpu: reserve 64M stolen memory for Apple 5K
 iMac
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <a826b32d-597a-4c01-8b30-218cbca8627a@gmail.com>
 <e0573e72-dcc1-4ff2-8cf2-53aefde912cb@amd.com>
 <CADnq5_M8f2Hgs06n9EXUaihGsr6YEm6G4YFVQmPfQbGU08XkBg@mail.gmail.com>
 <6f79a3e2-5510-4018-aabd-45fcdf5dcbb3@amd.com>
 <CADnq5_OTLQuD3B6-VUgZv6wGjhFNY_U77wqdv5Y+e25+O0B2ZA@mail.gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <CADnq5_OTLQuD3B6-VUgZv6wGjhFNY_U77wqdv5Y+e25+O0B2ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2026 13:37, Alex Deucher wrote:
> On Tue, Oct 27, 2026 at 9:16 AM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 10/27/26 07:57, Alex Deucher wrote:
>>> On Tue, Oct 27, 2026 at 8:21 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> On 10/26/26 23:46, Richard Lane wrote:
>>>>> Apple 27" 5K iMacs report a single 2560x2880 tile (28.125 MiB) in
>>>>> VIEWPORT_SIZE while scanning out up to 64 MiB across the relocated EFI
>>>>> framebuffer.
>>>>>
>>>>> Override the stolen VGA memory allocation size to 64 MiB when matching
>>>>> PCI_VENDOR_ID_APPLE with a 2560x2880x4 viewport size to prevent
>>>>> framebuffer corruption during boot handover.
>>>>
>>>> Hacks like those are usually a big no-go.
>>>>
>>>> Why is that framebuffer handling not working with DC out of the box?
>>>
>>> The GMC IP code reserves the memory used by the display hardware from
>>> the pre-OS console.  The gmc get_vbios_fb_size() callback looks to see
>>> what display viewport was set by the pre-OS environment.  If the Macs
>>> need a workaround, that's where it should go.  Since these displays
>>> require multiple display pipes, my guess is you need to double the
>>> allocation in that case since the current code just checks the first
>>> pipe.
>>
>>
>> Could this also be a logic error in that callback?  Would it be worth
>> double checking all the register values in that callback for this system?
>>
>> I know for example there are a few different IP specific implementations
>> in gmc_v9_0_get_vbios_fb_size().
> 
> Not likely.  I suspect the issue is that these systems use two display
> pipes so we only reserve enough memory to cover half of the display.
> On PCs the vbios never sets up MST.
> 
> Alex
> 

I tested doubling the allocation in gmc_v8_0_get_vbios_fb_size():

	if (adev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
	    size == (2560 * 2880 * 4))
		size *= 2;

That eliminated the corruption across the middle (45-60%) of the screen,
but still left a band of corruption along the very bottom (95-100%) of
the screen.

Dumping the DCE registers inside gmc_v8_0_get_vbios_fb_size() on the
iMac17,1 showed:

  vram_start = 0xf400000000, d1vga = 0x0
  CRTC0: grph_en=0x1 surf_hi=0xf4 surf_lo=0x300000 pitch=5120 vp_size=2560x2880
  CRTC1: grph_en=0x80000000 surf_hi=0x0 surf_lo=0x0 pitch=0 vp_size=0x0

Even though only CRTC0 is active at EFI boot with a 2560x2880 viewport,
Apple's EFI allocates a full 5120-pixel stride surface (mmGRPH_PITCH) and places
mmGRPH_PRIMARY_SURFACE_ADDRESS at a 3 MiB offset (0x300000) from
vram_start.

Because CRTC0 scans out 2880 lines at a 5120-pixel pitch starting at
offset 3 MiB, the active pre-OS scanout spans [3 MiB, 59.25 MiB) in VRAM:
- Reserving 2560 * 2880 * 4 (28.125 MiB) places permanent driver BOs at
  ~28.125..32 MiB, corrupting the middle (40-60%) of the screen.
- Reserving 2 * 2560 * 2880 * 4 (56.25 MiB) places those BOs at
  ~56.25..59.25 MiB, leaving the final 3 MiB exposed due to the 0x300000
  surface offset and corrupting the bottom (95-100%) of the screen.
- Accounting for the 5120 pitch and the 0x300000 surface offset reserves
  the full 59.25 MiB span and eliminates the corruption completely.

For v2 of the patch, which of the following two approaches in both
gmc_v7_0/v8_0_get_vbios_fb_size() would you prefer? Both tested working.

Option A (change whole function):

 static unsigned gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev)
 {
 	u32 d1vga_control = RREG32(mmD1VGA_CONTROL);
 	unsigned size;
 
 	if (REG_GET_FIELD(d1vga_control, D1VGA_CONTROL, D1VGA_MODE_ENABLE)) {
 		size = AMDGPU_VBIOS_VGA_ALLOCATION;
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
-		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
-			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) * 4);
+		size = REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
+		       RREG32(mmGRPH_PITCH) * 4;
+		if (size)
+			size += RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) -
+				lower_32_bits(adev->gmc.vram_start);
 	}
 
 	return size;
 }

Option B (add Apple 5K iMacs quirk):

 static unsigned gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev)
 {
 	u32 d1vga_control = RREG32(mmD1VGA_CONTROL);
 	unsigned size;
 
 	if (REG_GET_FIELD(d1vga_control, D1VGA_CONTROL, D1VGA_MODE_ENABLE)) {
 		size = AMDGPU_VBIOS_VGA_ALLOCATION;
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
 		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
 			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) * 4);
+
+		if (adev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
+		    size == (2560 * 2880 * 4))
+			size = size * 2 + RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS);
 	}
 
 	return size;
 }


Richard

>>
>>>
>>> Alex
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 10 +++++++++-
>>>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>> index 4204c3c750a8..8b196fbfa724 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>>>> @@ -1232,7 +1232,15 @@ void amdgpu_gmc_init_vga_resv_regions(struct amdgpu_device *adev)
>>>>>          } else {
>>>>>                  size = amdgpu_gmc_get_vbios_fb_size(adev);
>>>>>
>>>>> -               if (adev->mman.keep_stolen_vga_memory)
>>>>> +               /*
>>>>> +                * Apple 5K iMacs report one 2560x2880 tile in VIEWPORT_SIZE
>>>>> +                * while scanning out up to 64M across the relocated EFI
>>>>> +                * framebuffer.
>>>>> +                */
>>>>> +               if (adev->pdev->subsystem_vendor == PCI_VENDOR_ID_APPLE &&
>>>>> +                   size == (2560 * 2880 * 4))
>>>>> +                       size = 64U * 1024 * 1024;
>>>>> +               else if (adev->mman.keep_stolen_vga_memory)
>>>>>                          size = max(size, (unsigned)AMDGPU_VBIOS_VGA_ALLOCATION);
>>>>>          }
>>>>>
>>>>> --
>>>>> 2.55.0
>>>>
>>

