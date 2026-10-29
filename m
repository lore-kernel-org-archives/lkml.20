Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793233197;
	b=mETXfihBbw2ds6Rtf2m7Wi24YDoL4+2asgfjs4g5uvS7pwxmqEqTQaZyLLox2+v5DEav
	 XZAeB/hw0/iEvaENWvCy/yHY//jIIcSp/inuSsvvCMXCvRI5DD4KowHfXGtUB8QpL2z6L
	 Y8mMGFtl2TKTuzIj0g/zjv5AD1fXLRE1fOg/Xb6p4+q0tU+WmR1CQX8cULdR/E9OBTTn1
	 /nmbTSBQqZ0VAZpwkPPaZrlI61D/MpNlFqas8SZV921kj9agCU1/OuBbtgPdlNcnb9cfa
	 B2EGreDLnpAmnyRf3TmpSgYZ5h3b0v48reT9ACZIG5tDWBRChOyQ45Vesc0zLizkxRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793233197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZW5jbSU9sHcFIiUIR37IK6ebOrqcfR98GuBPuNbVnI0=;
	b=O4YidnlA0QVOC7p6wAcsrxUYyi2mOBRFOmI4ujZG+NW7hr7AfIdL61c6S3Lysz2uBO70
	 +y+RcwCz7GLtwGyIFG5jasFxG3qkffH1abED/sxL8te6d5mmOTyrKWSOsKB02UFm54qYQ
	 Qthm7YThtngNwZUiEdfD5h4EmbxDFFG5E2dRMHaBI6/Wjtp9Z2BceVJOxwT33eR7e4gYq
	 TKen99051TYunYcsWJ0m34APiQSXhxiR5YS2vQXkZ9BgZ/H4dPEANehGPr/+lGbLGHX2H
	 /GGo+QSe96OnLxsJvwQCPNGm1XrN+trKA9RMgAy7kwaWIbGzih7XTAGjev0reYRPmcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytj1VwiO;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F5A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytj1VwiO
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e345608cfso503195f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793233196; x=1793837996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZW5jbSU9sHcFIiUIR37IK6ebOrqcfR98GuBPuNbVnI0=;
        b=ytj1VwiOFyHmh5CzUEsGa8ZPV4KqG3DND2oE3rLJRemOxUwVhCNWBo8Sol2tUZfHW1
         XqLQMeXtOVE2HikHwZs/YXaumCYxED31UWq9IoTWekK+kRT1WkU/DCzucJZ3XoK8BrVg
         pKTygCrxhGOogQMaz68Fb7vKbVUtt6k+4v11FaK2IPXiii6MAKXrsoOfV+E6YGarME1j
         /WbTG8DwkNENMXT9DXoc8aS/BnfO9m/apessvAcE5OklDfhrivq4+9ZXaDF0cTQ+aXts
         tIZEytS+G6D1q3c15JiXOsU2EnI8XvBJ4KkI9+AhjmYY4sHXsYQfHmMr9UbOzfoU6jyn
         nOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233196; x=1793837996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW5jbSU9sHcFIiUIR37IK6ebOrqcfR98GuBPuNbVnI0=;
        b=pTXwZjg4uy7uiMsCPbV3vcXnoTcCeDqAAc6xCmcLIL3P/Vds8HP5bNMgTQ/KQbb56y
         PWbfckdwgaGrSlaWOvBsm/hibznEsAfGhosNx4f06Z6ijRv/eW5lm/4fyC6Mn0qoGSD1
         FJcbVUQPAzPAh8altHJb48ilIZ95UuxyA6xeqfVLgDTa60qJCSOgG9qZKemewOdMG2BN
         Ysl66YJg/tLy9HvOPHFCfZzrkeeCVnmSYK8AgHM0xXcy6tmM54V8CCDaNZOSRX0D8QnZ
         8pYMb5eYxlVVEalR731j0RfSSizs7xbWrDCioREqAaJh6ZB/PDyjnmLwp34yKi1d3n2r
         CqLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB14ACJJ3naKnvEQ2Uw12Bjx20DQ3EIBSbeCxZDo3MNPdmVHu3QXKSp5Fvq/sLcNzumtl8I6lxAdLSFhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ5gFaddvuTt0qXD/jP8gA02UfPXQyAp6qaV3N/CHpA6zC2ZwS
	AemMQpplO/HBKfIh5PU8VWVmZmr4h+AtA6Jr5wfsXidMFPV8YKUBaKCQNwPTa9BGsbygHA==
X-Gm-Gg: AYBFou2imiEQOZTi9k7wGLEUgB19iPtMEvdtg4+MnYEymzImMJIfARqB+mo4v1hwQ78
	/Yhh80HtJ9EaEfwXMCm0FRBHx6izcLd1mcLstLkmLZG/9ZRAoWcadhT3KTy4xtEoknjUhwq+l5B
	3wh3phILUCcQHsjf4RHOAsJtcMmStqReZZlxdNgGhzEl9/s2CA0gmUMUMEelhAXA+YFy/WEGQGW
	cSb5z7cjFqx8pIQRIPm92hgAnhCP1g8fhIlysymZXVx3ABSQ/hlfU/LBT8EZlMRjkXEkQxoN3O2
	DKGws8JT0Hh+lh2nmfspmfnj8FLWqDo4lRSaxAn/OQhYjhWZH9eN6U9mSc+wIbtbESlDfYjXlIh
	WM2N8r1m+Yq8ZeHZyZuuyyIpgKS1qFlvEhTDIrFvnEWzjuk+4uG6pK2Nc8jLxGGiBvdzcU4mnZg
	Yo5X01EFjjUAUMFFBMHK30/2VIHTEbbwRAJNiWfGjGNkfcili8rOmSVYub3MlaAv4WKDKqptd2U
	zr6GVw34rPBjo9jAzePMqIu0tsLDPNf9bbejKYp1J++rLzaI4566jBBF1/AlbT5+7b9JRjWdzxe
	A1yFdbE+Qp/1okjUfa1l1wE5vW6oJHd4n1BR
X-Received: by 2002:a5d:4841:0:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48e5d3120admr7194230f8f.51.1793233195559;
        Wed, 28 Oct 2026 17:19:55 -0700 (PDT)
Received: from [192.168.1.12] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm30427041f8f.2.2026.10.28.17.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 17:19:55 -0700 (PDT)
Message-ID: <9a6529e2-997a-48eb-9e65-c26d9070108b@gmail.com>
Date: Thu, 29 Oct 2026 00:19:52 +0000
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
Subject: Re: [PATCH 2/3] drm/amd/display: unlock secondary tile on Apple 5K
 iMac panels
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <18b5101d-c05e-45c0-a880-457bb7b9d887@gmail.com>
 <471336a8-35eb-4830-9f75-071f5b98bae4@amd.com>
Content-Language: en-US
From: Richard Lane <richardlanedev@gmail.com>
In-Reply-To: <471336a8-35eb-4830-9f75-071f5b98bae4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2026 17:13, Mario Limonciello wrote:
> 
> 
> On 10/26/26 17:48, Richard Lane wrote:
>> Apple 27" 5K iMacs (2014-2019, iMac15,1 through Polaris-based iMac19,1)
>> expose their internal 5120x2880 panel as a 2x1 tiled display over an eDP
>> root link and a secondary DP link. At boot, the panel TCON operates in
>> single-pipe mode and holds the secondary DP link's HPD line low until
>> unlocked via DPCD registers.
>>
>> Enable native tiled detection and link training for DCE < 12 Apple 5K
>> panels:
>> - Pair the two internal dc_link instances during EDID quirk matching for
>>    DCE < 12 iMac15,1, iMac17,1, iMac18,3, and Polaris-based iMac19,1
>>    (identifying roles via connector_signal since panel IDs can flip
>>    across the two links after S3 wake). DCE >= 12 support for Vega-based
>>    iMac19,1, iMacPro1,1, and iMac20,x is documented as TODO.
>> - Avoid falling back to DVI and latch the secondary tile via DPCD 0x4F1
>>    on the root eDP link when probing the secondary link.
>> - Write the 3-byte Boot Camp source table (0x04, 0x1d, 0x03) to DPCD
>>    0x310 in dpcd_set_source_specific_data() to unlock the secondary tile.
>> - Prevent the secondary tile from entering DP_SET_POWER D3, which causes
>>    the TCON to drop HPD and stop responding to AUX transactions.
>> - Override the secondary tile's connector type to DRM_MODE_CONNECTOR_eDP
>>    so userspace compositors treat both tiles as a single built-in display.
>> - Unlatch both tiles (0x4F1) and clear DP_SOURCE_TABLE_REVISION (0x310)
>>    and DP_EDP_CONFIGURATION_SET (0x10A) in dm_suspend() so the TCON
>>    returns to single-pipe mode for the EFI boot screen across reboots.
>>
>> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 31 +++++++++++++++++
>>   .../display/amdgpu_dm/amdgpu_dm_connector.c   |  6 ++++
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 34 +++++++++++++++++++
>>   drivers/gpu/drm/amd/display/dc/dc.h           | 12 +++++++
>>   .../drm/amd/display/dc/link/link_detection.c  | 14 +++++++-
>>   .../dc/link/protocols/link_dp_capability.c    |  7 ++++
>>   .../display/dc/link/protocols/link_dp_phy.c   |  8 +++++
>>   7 files changed, 111 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index bdabb4bf14da..548f975c7324 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -1607,6 +1607,35 @@ STATIC_IFN_KUNIT void dm_destroy_cached_state(struct amdgpu_device *adev)
>>   }
>>   EXPORT_IF_KUNIT(dm_destroy_cached_state);
>>   +/*
>> + * Unlatch Apple 5K panel tiles and reset DPCD state on suspend/shutdown.
>> + * This returns the TCON to single-pipe mode so the EFI boot logo is not
>> + * skewed on reboot.
>> + */
>> +static void amdgpu_dm_apple5k_unlatch(struct dc *dc)
>> +{
>> +    const u8 zeros[3] = { 0 };
>> +
>> +    for (int i = 0; i < dc->link_count; i++) {
>> +        struct dc_link *link = dc->links[i];
>> +
>> +        if (dc_link_is_apple_5k_secondary(link)) {
>> +            /*
>> +             * Clear Boot Camp source table (0x310), eDP config
>> +             * (0x10A), and secondary tile latch (0x4F1).
>> +             */
>> +            core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION, zeros, 3);
>> +            core_link_write_dpcd(link, DP_EDP_CONFIGURATION_SET, zeros, 1);
>> +            core_link_write_dpcd(link, 0x4F1, zeros, 1);
>> +
>> +            /* Unlatch primary root tile */
>> +            core_link_write_dpcd(link->tiled_peer, 0x4F1, zeros, 1);
>> +
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>>   static int dm_suspend(struct amdgpu_ip_block *ip_block)
>>   {
>>       struct amdgpu_device *adev = ip_block->adev;
>> @@ -1674,6 +1703,8 @@ static int dm_suspend(struct amdgpu_ip_block *ip_block)
>>         amdgpu_dm_hpd_rx_irq_work_suspend(dm);
>>   +    amdgpu_dm_apple5k_unlatch(dm->dc);
>> +
>>       dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
>>         if (dm->dc->caps.ips_support && adev->in_s0ix)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
>> index ded8e21897f1..27de7965f366 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
>> @@ -3460,6 +3460,12 @@ int amdgpu_dm_connector_init(struct amdgpu_display_manager *dm,
>>       }
>>         connector_type = to_drm_connector_type(link->connector_signal, link->link_id.id);
>> +    /*
>> +     * Override Apple 5K secondary tile to eDP so compositors treat it as
>> +     * built-in.
>> +     */
>> +    if (dc_link_is_apple_5k_secondary(link))
>> +        connector_type = DRM_MODE_CONNECTOR_eDP;
>>         res = drm_connector_init_with_ddc(
>>               dm->ddev,
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 9774ea33272d..db6ac803e14f 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -97,6 +97,21 @@ STATIC_IFN_KUNIT u32 edid_extract_panel_id(struct edid *edid)
>>   }
>>   EXPORT_IF_KUNIT(edid_extract_panel_id);
>>   +/*
>> + * Pairs the two internal hardware links driving the Apple 5K panel,
>> + * allowing the driver to synchronize both tiles as a single display.
>> + */
>> +static void dm_helpers_wire_tiled_peer(struct dc_link *link)
>> +{
>> +    u32 peer_index = link->link_index ^ 1;
>> +
>> +    if (link->ctx->dce_version < DCE_VERSION_12_0 &&
>> +        peer_index < link->dc->link_count) {
>> +        link->tiled_peer = link->dc->links[peer_index];
>> +        link->tiled_peer->tiled_peer = link;
>> +    }
>> +}
>> +
>>   STATIC_IFN_KUNIT void apply_edid_quirks(struct dc_link *link, struct edid *edid,
>>                     struct dc_edid_caps *edid_caps)
>>   {
>> @@ -173,6 +188,25 @@ STATIC_IFN_KUNIT void apply_edid_quirks(struct dc_link *link, struct edid *edid,
>>           drm_dbg_driver(dev, "Force FreeSync min to 60 Hz on panel id %X\n", panel_id);
>>           edid_caps->panel_patch.force_freesync_min_hz = 60;
>>           break;
>> +    /*
>> +     * Workaround for Apple 27" 5K iMacs which expose a 2x1 tiled internal
>> +     * panel over an eDP root link and a secondary DP link. Wire the peer
>> +     * links to latch and synchronize both tiles, using connector_signal
>> +     * for role assignment as panel IDs can flip after wake.
>> +     * IDs (Root/Tile): iMac15,1 (AE01/02), iMac17,1 (AE05/06),
>> +     * iMac18,3 (AE11/12), iMac19,1 (AE25/26); TODO (DCE >= 12): iMac19,1
>> +     * Vega (AE25/26), iMacPro1,1 (AE1D/1E), iMac20,x (AE31/32).
>> +     */
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE01):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE02):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE05):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE06):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE11):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE12):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE25):
>> +    case drm_edid_encode_panel_id('A', 'P', 'P', 0xAE26):
>> +        dm_helpers_wire_tiled_peer(link);
>> +        break;
>>       default:
>>           return;
>>       }
>> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
>> index f4fefa7c9ab8..498c11c0616f 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dc.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
>> @@ -2003,6 +2003,12 @@ struct dc_scratch_space {
>>       bool skip_implict_edp_power_control;
>>       bool forced_psr_active;
>>       enum backlight_control_type backlight_control_type;
>> +
>> +    /*
>> +     * Partner link for dual-tile Apple 5K panels, wired during EDID quirk
>> +     * matching.
>> +     */
>> +    struct dc_link *tiled_peer;
> 
> This feels like it's re-inventing drm_connector's has_tile, and tile_group.
> 
> There is also a special "tile_is_single_monitor".
> 
> Can you use those instead?

I tested dropping the DRM_MODE_CONNECTOR_eDP override in
amdgpu_dm_connector.c and confirmed that once the secondary link's EDID
is read, DRM's DisplayID parser populates has_tile, tile_group, and
tile_is_single_monitor on both connectors, which Mutter handles
correctly. So I will drop the addition to amdgpu_dm_connector.c in v2.

However, drm_connector's has_tile and tile_group cannot be used for the
initial DPCD bringup in DC because those properties are only populated
after the secondary link's EDID has been read. At boot, the panel TCON
operates in single-pipe mode and holds the secondary DP link's HPD line
low. Until DC writes 0x01 to DPCD 0x4F1 on the primary eDP link (when
probing the secondary link in link_detect_connection_type()), bypasses
the low HPD state, and writes the 3-byte sequence to DPCD 0x310 on the
secondary link, the secondary link cannot be detected or read its EDID.

Therefore, link->tiled_peer is still needed in dc_link to reference the
partner link for the pre-EDID DPCD 0x4F1/0x310 TCON latch/unlatch and D3
sequences.

Richard

> 
>>   };
>>     struct dc {
>> @@ -3172,6 +3178,12 @@ struct dc_sink {
>>     void dc_sink_retain(struct dc_sink *sink);
>>   void dc_sink_release(struct dc_sink *sink);
>> +/* Helper to identify secondary (DP) tile of the Apple 5K panel. */
>> +static inline bool dc_link_is_apple_5k_secondary(const struct dc_link *link)
>> +{
>> +    return link && link->tiled_peer &&
>> +           link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT;
>> +}
>>     struct dc_sink_init_data {
>>       enum signal_type sink_signal;
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index b4546f93af0c..25662ed3e612 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -218,7 +218,8 @@ static enum signal_type link_detect_sink_signal_type(struct dc_link *link,
>>                * we assume signal is DVI; it could be corrected
>>                * to HDMI after dongle detection
>>                */
>> -            if (!dm_helpers_is_dp_sink_present(link))
>> +            if (!dc_link_is_apple_5k_secondary(link) &&
>> +                !dm_helpers_is_dp_sink_present(link))
>>                   result = SIGNAL_TYPE_DVI_SINGLE_LINK;
>>           }
>>           break;
>> @@ -1625,6 +1626,17 @@ bool link_detect_connection_type(struct dc_link *link, enum dc_connection_type *
>>           }
>>       }
>>   +    /*
>> +     * Internal tiled DP secondary reports HPD low until latched. Latch
>> +     * the secondary tile via the root eDP link's DPCD (0x4F1) and force a
>> +     * single-sink connection.
>> +     */
>> +    if (*type == dc_connection_none &&
>> +        dc_link_is_apple_5k_secondary(link)) {
>> +        core_link_write_dpcd(link->tiled_peer, 0x4F1, &(const uint8_t){1}, 1);
>> +        *type = dc_connection_single;
>> +    }
>> +
>>       return true;
>>   }
>>   diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
>> index ad1a499b0d9d..15f223e48091 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
>> @@ -1496,6 +1496,13 @@ void dpcd_set_source_specific_data(struct dc_link *link)
>>                   link->dc->vendor_signature.data.raw,
>>                   sizeof(link->dc->vendor_signature.data.raw));
>>       }
>> +    /*
>> +     * Write the 3-byte Boot Camp source table (0x310) required to unlock
>> +     * the secondary tile.
>> +     */
>> +    if (dc_link_is_apple_5k_secondary(link))
>> +        core_link_write_dpcd(link, DP_SOURCE_TABLE_REVISION,
>> +                     (const uint8_t[]){0x04, 0x1d, 0x03}, 3);
>>   }
>>     void dpcd_write_cable_id_to_dprx(struct dc_link *link)
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
>> index 49521ac4b0e8..abac117d0514 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
>> @@ -50,6 +50,14 @@ void dpcd_write_rx_power_ctrl(struct dc_link *link, bool on)
>>       if (link->sync_lt_in_progress)
>>           return;
>>   +    /*
>> +     * Prevent Apple 5K secondary tile from entering D3 power-down.
>> +     * Powering it off causes the TCON to drop HPD and stop responding to
>> +     * AUX.
>> +     */
>> +    if (!on && dc_link_is_apple_5k_secondary(link))
>> +        return;
>> +
>>       core_link_write_dpcd(link, DP_SET_POWER, &state,
>>                            sizeof(state));
>>   
> 

