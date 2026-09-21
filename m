Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5A4A485B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001399; cv=pass; b=FoBksWhmrxGCMtV35INCAQxd41a34rNHvEBvGI2Eh5bivi7Fz9q/QCJvheeG6Tp9kyEYsEjYjfdgNsStC2ERJkeoLGMG4Hp9v+HwokRS9Y0Iq8XtuZBa90ZbDkdPxGIgfJQep/UzxALl/X+pJ4IA4aUnUC3uQwP15yxRB1UV/Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001399; c=relaxed/simple;
	bh=L7K5h9ss5itYa3PVNVnsJLd0vmUVmWWDUWKgAFHYFq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwyaBQpxaRiY01Dylt/bPy+IcK+iRPuCR9NgjXp72Yly0ocCMnC+gh1OGh/1cJdRcwLsH0cSJV7tz1t+LMGfIeUeyRNS9fWE3PIkqoi+RTOrMqPmgPqzAsDLLy+Fh7KcfHZp2vf24Lfbjk0k8qptpQINRqQBak69qHfpeo0hGj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QImxfmys; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QImxfmys"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e50968489so2741641d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001397; cv=none;
        d=google.com; s=arc-20260327;
        b=Xweuw5ntSkC86Kuy48NazurcWVGTovb2a/eK274RwTEPGia1XA84XIZLs99VCu/2mm
         hlJyY4Q4KSiN8h5iVxWX/FsPfdMHIZq56ZWp3PaUyPY958IleB07Xe36i5A7eRCkkDyu
         rk3i/PwwPSm84fyQjiaMKV+DjPZNhMD6U0+Ub89ElXsPPw/CL1zuJm7ZZkUfRt5lTBYk
         kaZhZ2C2G2I4DpEFbkHL65V5z7QnzNVecnSZam8N3nmi5//ZFbwxPDrdeVx886i6tAxm
         jCZBrxQDNvdJnZkkDIriQauOG1tEGp4Y7fz2w7AYWV8w2wPiaCCepO+IOOcWJl/oMi3Y
         NjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        fh=mdYolPe8pIav7gEdPvv62JrzIv33VLjYcl4rf/n/shc=;
        b=bayq9AzmqL/NjctuEuqYmV9xWXao2kqlh5cFhscjA1zvAhw+QOP+FCydCzoKC4sBNN
         AQeYdZyLkWFKWUTyXnnDmlyXj34EY1eMzgwgdYZsCo9MCrGCRsnSI3xWjj56h2YRF5R7
         JD/PPH/fAq0IQdzOClg4VNGIaZ4bWx73C/N2hhqHyeKFWOxXH7LcY9inkHp3hwEJ6Yg8
         L93dBSvQiu/qumZEKOxNX03glkuYN9O/PQEusflSPdtbQWnlozij39g29s4xDjtYYrsC
         bv8OChSM/xt9g8h4IMyJEIJX0bE80eXfFtL6I0sllXDkZs4sWCT+Mji0t7eBdftUYv4R
         poCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790001397; x=1790606197; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=QImxfmysaImtqZ+ui3x9VJPDG5rBcvcV46keBb06SfHfbPH4+bbxaJKw1ZGNQdiy5x
         ddqyuT3VOB1jZRsv/13myxMX+H77tz/cL+Jah+OXt62LmgTxoawRj6QF7MkNN1dz93Qo
         D2iq/giyHgOwsSy7j3aXKwSSJAsrtzCoSR2PV/oOy1KQRem1F7nChx8BCgRDrWhCIvEX
         HDKim0r6qIQrMVAglgTzh78bsbduMAUvqnsTyQr/KzASi2RtbzNhOD2MiBk8Kj2fqsrP
         YyQXYq78vsBJXEJTdu3dD/eYJGgA2vxFFpuCedi32xi16kUyoREG0B6YvndItrk7WiAR
         //1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001397; x=1790606197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=wNTtbMBsdGyMrDLnqtpf1pkSCQ6RJeGqJEwIXChmc512+sso+LcEQdUIrQXF+kjEWp
         BlAaKoeEScxHm67+MUDq+LdKliyhnUcNxV/+EoeOJch3skKniH8SDSwSVIsK0QLD2+Dk
         /GGtaSItbiCF+SfVBnj0t5gHTZ1m7fAOaqMcYCX5Ul5H/YEyfqKOq7AGhdOq+WmWFS/V
         Cn52LoH8adrUNWex0k3RSB/v/iGUoTtvMZqlQyFDlEOl8ZgAKBZs4uaZl4uudINUeNet
         oQ/hm+0VHQipzw2K/hTyGndphkuqwGlXg/D8U67AFlJCEn4NbaNJBJshrqLezBHaUwC/
         2NaA==
X-Forwarded-Encrypted: i=1; AKwUvBwyVHJ7lQvWWRmpBfG2XR0sfxnWRV7SovGBYYG9zxHNX1kqgUz0JcWUUAC8cTo/mpioKIX2aCZ92NddHVM=@vger.kernel.org
X-Gm-Message-State: AFuF++meAwNmE+VLK8pN9ZAYX085Z0sir1S4FXXRPC4yxDQbHPmS19bj
	C6mSLeub5Wj8w0eNpRbOb5xI/I8ITnObc9JfPfIdCj/UCXTlVPhkL3vaXRP7SZqwZCfSr6zdtY+
	DltH7jDAN6OwyXB6j663O0neDaZrhw9I=
X-Gm-Gg: AYBFou2vUgzV0m1Rc8O1Ze2RAQ3JMOMesJV9zWTkVp6Z8yymFnT9ABA3BJP1tah2tBa
	dzHsqRx2AQyjmzyso+AaBSoXIvU5Nb1KVL1DIjBd8XcUrlZp+976OZug5AXIBgcxkr2OTWLfZJd
	CyhK2mkNf9JMEM8okldZ2aog7Fxax1YxLNmwsC8SANzAo9+Nn18AHmahzzmAuR7gO2fhV7ERVrI
	3yvMvstPhuTGuPb3S3/eIW5OZ72EfJScR1PrjYFy93mbOtDB/IPILPXPmTzmS8dEbNFRFkY14HF
	9RS16RphtR8Y0xed0vQXOZ65QU254MQanOZ3lOyr24WHTc1eIsw3OJliOw==
X-Received: by 2002:a05:690e:43cf:b0:66f:ac49:a27a with SMTP id
 956f58d0204a3-6717fc65521mr2383542d50.14.1790001396949; Mon, 21 Sep 2026
 07:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916051618.2904439-1-lgs201920130244@gmail.com> <178962811102.1264013.13698060411191875408@gmail.com>
In-Reply-To: <178962811102.1264013.13698060411191875408@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 22:36:24 +0800
X-Gm-Features: AcwNN1VX0XaLkydRZySUPzjNak9mjroYac8VQM-fZ7BBkk7Judurvc9M8LXCNAM
Message-ID: <CANUHTR9Csn86KgVMTCBPBobAjg78-M3TR1VTz--yLyG74w6YbQ@mail.gmail.com>
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
To: Wayen Yan <win847@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wayen,

Thanks for the detailed review.

On Thu, 17 Sept 2026 at 14:55, Wayen Yan <win847@gmail.com> wrote:
>
> Hi Guangshuo,
>
> Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
> the right direction, since the probe error path already tears PPE down
> but the successful remove path currently does not.
>
> However, I think the cleanup is still incomplete.
>
> mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
> rhashtable:
>
>     rhashtable_destroy(&eth->ppe[i]->l2_flows);
>
> This only destroys the hash table itself. It does not free any entries
> that may still be stored in it. In this driver, L2 offload entries are
> struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
> and inserted into eth->flow_table, and bridge/L2 entries are also
> indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().
>
> There is also a lifetime mismatch for eth->flow_table:
> mtk_eth_offload_init() initializes it, but I do not see a matching
> destroy/free on the remove path.
>
> So I think remove should first drain the offload flow entries, using the
> same per-entry teardown as mtk_flow_offload_destroy():
>
>     mtk_foe_entry_clear(...)
>     mtk_wed_flow_remove(...) when needed
>     kfree(entry)
>
> and then destroy eth->flow_table and the per-PPE l2_flows tables.
> rhashtable_free_and_destroy() with a small callback would probably fit
> this better than plain rhashtable_destroy().
>
> While touching mtk_ppe_deinit(), it would also be better to use continue
> instead of return for missing PPE instances, so later PPE instances are
> not skipped.
>
> One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
> debugfs directory, but the PPE teardown path does not remove it.
>
> So I agree with the fix direction, but I think this should be respun as
> a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
> to mtk_remove().
>
> Thanks,
> Wayen
>
Agreed. I'll extend the cleanup to drain eth->flow_table with
rhashtable_free_and_destroy(), using the same per-entry teardown as the
normal flow destroy path, then remove the PPE debugfs entries and destroy
the per-PPE l2_flows tables.

I'll also make mtk_ppe_deinit() continue past missing PPE instances and
send a v2 with these changes.

Thanks,
Guangshuo
