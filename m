Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700212;
	b=f+ai16a39ilth8hr7oe33o2u7l4r5wc44qisffZptdiQcSwI/nkPAK3C6CbBNnD/6hr9
	 elt2f5F0KKclJrjSsDN8XoBBzSbcY56LWX5ozXa/jdrIFBZhXOYXPN1tHTCxdbrt7xf91
	 qjSTFo5jKhKKGRugCHN7w3G8ffH1Txw4iz6Xw1tJraWI9sScAF6y0zcoloyr5JeXHbyv3
	 DTPvuAudBxacyD2MRPgWjbKvAL7HnZqolNxEouqyAj/1fU9/a/twBhmPSlyfJOg2XYcD2
	 YLidxMD+vgZT3XlwuigWZXhGQNmzYId4pukQSDw6UmhqRFjlkW4HL3juJpW+6uqkmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+8r4oU1PaotOvBc2yCW4rJ70JHVpEbkd+VJawQRJ+Jw=;
	b=VezZ7NZH44vjilkbHpADEixZIizPqpef0cSa04oBIWlE9YTQGXe5b5Aml+F8Ji2jOb10
	 rBZDAgjgZ0RjazrM8Qd2xS2UuD8kWlcZ9NLPCGbF2W8ouKay3Z0r7/p5iHuE2xDvvgm0e
	 2AwWicAjeZ16c9tO/t1KvRD1ZIcr3XvyTPC46XC4dLiwg7vu/fqmJjTVQ49eNYMnkKCxW
	 bmQvKmmFi/GRZhintE56QVhXgY5EjhIBQMrvMsKGUpPV6dgtW1Y3oHuvGcO7VUXgHyHCy
	 p0t5dOC594i8qbD5FJf7FweVDYFKMJOdX8tlJ3Rrk+8wzhVCt0sXOT7owhR8ZoXr+Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o61PPVJO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8yCirEu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F14E606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F14E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o61PPVJO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8yCirEu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AELGI9I571193
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+8r4oU1Paot
	OvBc2yCW4rJ70JHVpEbkd+VJawQRJ+Jw=; b=o61PPVJOj8Wj4bZ+B3S617IEaQp
	v753I4coA8Ug5QHsPwgHj0fk4wq+TPkzoX6jgUeXSqh4rcXBFkWy4OWQTbNOODLM
	reroqL5+jtfYQL2ZJPBrB8st59h16ZRePxXgr9rDykxrvcbCFpkOrGxlkuv0PCOo
	XbyvPcsBIHbdw0UVOQ3yjsjTI2KKBo/DJFkrgSun+FCcMtkcduqY8Xfz6j4OI3g+
	QQO0hs3plBAXpypHfx1zZzQ7Y9WjIDktmyfM68x7N6cQDEJ5k1l0SnAB3NtWySOG
	Ncdz/glFyR+3bghE3DyayGX03s2ZbvDnyukG2kfTMQsSHuZdREoQ/ucf1sA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx209s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:50:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so397824eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794700209; x=1795305009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8r4oU1PaotOvBc2yCW4rJ70JHVpEbkd+VJawQRJ+Jw=;
        b=R8yCirEuLVfD1/hmJQ+jNKXerwIgzP0XsgP9kX0iOnbV9vfswn5CKMaglTbRzWuL0R
         WEyodwGa1MmuxqAs3XASDchy6AhXaYpL9evPaRv03cg3Fc3P8SepwPWpgpYOfQetL2Vo
         EHdpy1nxCgeLi7iGdLeieOVyi/eqBgNWplk8pOexs3BE7lToLY6lidCGb02LWiNlnpDS
         AFwKP55yJEnNlHg0YWg3dNdPBRr8Ri6p0MgzRWbU3tldK+YRviZrkbLIiWAaYIn7UTIK
         LCMbBRUbxlQEafPmE883eg6hqrQh3INfD7lwB6Ngo1yTmEI9a7jc9Bfv587po+uBF6MY
         1AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700209; x=1795305009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8r4oU1PaotOvBc2yCW4rJ70JHVpEbkd+VJawQRJ+Jw=;
        b=FlJS2kxsFtrl0haUE4MfSfisB4TGM88WQjuumrBPM85HTnog+8CIl/qM8A1uCnVUzy
         VbS+TJj+xxIQ5AWeep89gYwyzMPpeHlMsRWqrnIUFdMOXT+NuFbcXbZU9+ywaLBHgJbX
         uivPJhKyNT8z1ljjJtKFb2e9so4Dmls/DMymWFzfyL7f0QdSOtjE4goUVc7v3yNw6ftn
         JWcJAUutw8A+p1O7fGJ73k29JkgzfLtp9t71gL+3vkgebMNQoPaklhURP9peeo/X8HJw
         jz3Gth4dn/B0CMAItPYN9cnErWjItjBxzG1GSJPIbxCj2FP7u0Ku3DCHgkw16ylt+Vgw
         Xi4Q==
X-Gm-Message-State: APuU4Z9Q2dBDEE6FNOuYiy5zFyNoyLoHPZ+2PVveLazpEoNiG5dBWtz+
	+XGV7sicOODwuWMcCi8QEYbCIHw+A3wNH2eADLI++gTfJ9kl6oPOBAq0E7fVlbDyWLSXjdDQ2Xu
	avcXpN08S1cp6jPcav8yTBX8TzU8M5BXNHMiJCGUrlTAAx8+d8TE4GQzWvCUEQEvN0Oo=
X-Gm-Gg: AYBFou3NZ9LDqWLXxCXvBetHfGdvdPd9VGGGuDJ7g8cy2PJSCTBbJdBjYSsOEBf4Qne
	vBmi2W3Y6Vg/6HRib64yl4DEl94vb2GPBeKnvCmrx3/P7pKFAM73I5Mf8rXkPSpKnOSz8oRAwoo
	dKcv0JcL5tH2cnR9zKsCmfjsa14UeadEEH0OmqXU3fHGB1qA5/whZ46J99/gu2EQIZx+dRiNvqB
	Jn/g+Re6qT1Al8fXkA8iO4j5MfWuev07y9Mt+OCgBIPy0UfduNzJpOR+lmRZmIWthdijYXR92JG
	6b9j0DHnPNibQE1VZH/yS28cEZOLt8SYUjU0GQPtZLh+Z9nkaMVjnfQ+9wQdDFeWBy/tlwF57nS
	iXovRDUtyhgWU24sg24g8xwh13zUm2Htbb1DWgPQ/dIKrGrMUv1OmCtOSNb9Ev1Jjl2zyW0FJni
	2GkF87caakf6i9D0pLX35jQA==
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr5186639eec.14.1794700209115;
        Sat, 14 Nov 2026 15:50:09 -0800 (PST)
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr5186620eec.14.1794700208568;
        Sat, 14 Nov 2026 15:50:08 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm39456313eec.20.2026.11.14.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:50:04 -0800 (PST)
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: "Linux ARM Kernel" <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Vladimir Murzin" <vladimir.murzin@arm.com>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
        "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
        "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Liaochang" <liaochang1@huawei.com>, "Marc Zyngier" <maz@kernel.org>,
        "Radu Rendec" <radu@rendec.net>,
        "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
        "Ashok Raj" <ashok.raj@oss.qualcomm.com>,
        "Sathvika Vasireddy" <sathvika.vasireddy@oss.qualcomm.com>
Subject: [RFC PATCH v1 1/2] genirq: Add migratable NMI registration mode
Date: Sat, 14 Nov 2026 15:49:45 -0800
Message-ID: <20261114234946.818072-2-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX140IOsZorypR
 /cb7Li79twTPGq9+plP3m3VUu5ZeDfOEoNlt4cKwehFEbjRGM6E1pIfjGIXozbXpNH8rYnJq/qw
 6wb7UnbFyoNWk0xAAkOVXlK+6lACBgoqsaT59dJTrYXkvm3/0/Fv6eisUtVn7XwvL69zLx8RIpW
 wXPF38S6zTzQunYhdyq5euWkng1AOee5vXhihPNEg51QE3dV328RmY3p8psSKT5GnV0ihLw1Cp8
 DnmMCP2aBu819fFPryOlys9M6WUWqbDqtshvPUQtKI8SZbJcj6qdBN33Dwijsadyz2U/WABT0cU
 3c4Nu4LyrGLOIte1wgXHrUSzFTMoAbchA4FH+mpxYYccAducdt17GUVY3YhP5HLnNkSFomCSUUp
 JpEsAWVGswjpz9UfzxzZt9yjZwAsYsTMc1S0zRDc7Jhwly8DGdlPnpFA/bKAH4DHWEkI533Oyq5
 kTpTyGMcr5cSTwJ1lNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA5NCBTYWx0ZWRfX0WcWbs4H8MHv
 KUkLmLdTG2yxz4urNhRE5ryeiDv+ibGLXTMsyzmhjHd4ik5C74FJXcB7J/YALFpYgmkDTVI1Q4j
 1hY93PqbRM51Ua85rZqOFdt48gxAA5M=
X-Proofpoint-ORIG-GUID: U_I2xh87uLBBCwr8ab3EgNyUvsDcncHw
X-Proofpoint-GUID: U_I2xh87uLBBCwr8ab3EgNyUvsDcncHw
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8f3b2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AEXGT912vSUxQWkpZ70A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140094

request_nmi() only supports per-CPU NMIs, so a globally routed NMI
source cannot use the generic CPU-offline IRQ migration path.

Add IRQF_NMI_MIGRATABLE for a non-per-CPU NMI. Require an
affinity-capable irqchip, preserve the NMI no-balancing policy, and
allow generic startup affinity and CPU-hotplug migration to route the
source. Keep local per-CPU NMIs unchanged.

Add KUnit coverage for registration validation and CPU-offline
migration.

Signed-off-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
---
 include/linux/interrupt.h |   2 +
 kernel/irq/irq_test.c     | 141 +++++++++++++++++++++++++++++++++++++-
 kernel/irq/manage.c       |  33 +++++++--
 3 files changed, 168 insertions(+), 8 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index ee2dd5349697..58c917ce7655 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -46,6 +46,7 @@
  * IRQF_TIMER - Flag to mark this interrupt as timer interrupt
  * IRQF_PERCPU - Interrupt is per cpu
  * IRQF_NOBALANCING - Flag to exclude this interrupt from irq balancing
+ * IRQF_NMI_MIGRATABLE - NMI source can be migrated during CPU hotplug
  * IRQF_IRQPOLL - Interrupt is used for polling (only the interrupt that is
  *                registered first in a shared interrupt is considered for
  *                performance reasons)
@@ -86,6 +87,7 @@
 #define IRQF_NO_AUTOEN		0x00080000
 #define IRQF_NO_DEBUG		0x00100000
 #define IRQF_COND_ONESHOT	0x00200000
+#define IRQF_NMI_MIGRATABLE	0x00400000
 
 #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
 
diff --git a/kernel/irq/irq_test.c b/kernel/irq/irq_test.c
index e2d31914b3c4..5cc3caed661c 100644
--- a/kernel/irq/irq_test.c
+++ b/kernel/irq/irq_test.c
@@ -25,7 +25,7 @@ static int noop_affinity(struct irq_data *data, const struct cpumask *dest,
 {
 	irq_data_update_effective_affinity(data, dest);
 
-	return 0;
+	return IRQ_SET_MASK_OK_DONE;
 }
 
 static struct irq_chip fake_irq_chip = {
@@ -41,6 +41,40 @@ static struct irq_chip fake_irq_chip = {
 	.flags          = IRQCHIP_SKIP_SET_WAKE,
 };
 
+static int noop_nmi_setup(struct irq_data *data)
+{
+	return 0;
+}
+
+static struct irq_chip fake_nmi_irq_chip = {
+	.name			= "fake-nmi",
+	.irq_startup		= noop_ret,
+	.irq_shutdown		= noop,
+	.irq_enable		= noop,
+	.irq_disable		= noop,
+	.irq_ack		= noop,
+	.irq_mask		= noop,
+	.irq_unmask		= noop,
+	.irq_set_affinity	= noop_affinity,
+	.irq_nmi_setup		= noop_nmi_setup,
+	.irq_nmi_teardown	= noop,
+	.flags			= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_SUPPORTS_NMI,
+};
+
+static struct irq_chip fake_nmi_noaffinity_irq_chip = {
+	.name			= "fake-nmi-noaffinity",
+	.irq_startup		= noop_ret,
+	.irq_shutdown		= noop,
+	.irq_enable		= noop,
+	.irq_disable		= noop,
+	.irq_ack		= noop,
+	.irq_mask		= noop,
+	.irq_unmask		= noop,
+	.irq_nmi_setup		= noop_nmi_setup,
+	.irq_nmi_teardown	= noop,
+	.flags			= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_SUPPORTS_NMI,
+};
+
 static int irq_test_setup_fake_irq(struct kunit *test, struct irq_affinity_desc *affd)
 {
 	struct irq_desc *desc;
@@ -60,6 +94,22 @@ static int irq_test_setup_fake_irq(struct kunit *test, struct irq_affinity_desc
 	return virq;
 }
 
+static int irq_test_setup_fake_nmi(struct kunit *test, struct irq_chip *chip)
+{
+	struct irq_desc *desc;
+	int virq;
+
+	virq = irq_domain_alloc_descs(-1, 1, 0, NUMA_NO_NODE, NULL);
+	KUNIT_ASSERT_GE(test, virq, 0);
+	irq_set_chip_and_handler(virq, chip, handle_simple_irq);
+
+	desc = irq_to_desc(virq);
+	KUNIT_ASSERT_PTR_NE(test, desc, NULL);
+	irq_settings_clr_norequest(desc);
+
+	return virq;
+}
+
 static void irq_disable_depth_test(struct kunit *test)
 {
 	struct irq_desc *desc;
@@ -164,6 +214,93 @@ static void irq_shutdown_depth_test(struct kunit *test)
 	free_irq(virq, NULL);
 }
 
+static void irq_nmi_migratable_test(struct kunit *test)
+{
+	struct irq_desc *desc;
+	struct irq_data *data;
+	const struct cpumask *affinity;
+	int virq, ret;
+
+	if (!IS_ENABLED(CONFIG_SMP))
+		kunit_skip(test, "requires CONFIG_SMP for NMI migration");
+	if (!get_cpu_device(1))
+		kunit_skip(test, "requires more than 1 CPU for NMI migration");
+	if (!cpu_is_hotpluggable(1))
+		kunit_skip(test, "CPU 1 must be hotpluggable");
+	if (!cpu_online(1))
+		kunit_skip(test, "CPU 1 must be online");
+
+	virq = irq_test_setup_fake_nmi(test, &fake_nmi_irq_chip);
+	desc = irq_to_desc(virq);
+	KUNIT_ASSERT_PTR_NE(test, desc, NULL);
+
+	data = irq_desc_get_irq_data(desc);
+	KUNIT_ASSERT_PTR_NE(test, data, NULL);
+
+	ret = request_nmi(virq, noop_handler,
+			  IRQF_NMI_MIGRATABLE | IRQF_NO_AUTOEN,
+			  "test_nmi", NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_TRUE(test, irq_is_nmi(desc));
+	KUNIT_EXPECT_FALSE(test, irqd_is_per_cpu(data));
+	KUNIT_EXPECT_FALSE(test, irq_settings_is_per_cpu(desc));
+	/* Userspace affinity remains disabled by IRQF_NOBALANCING. */
+	KUNIT_EXPECT_FALSE(test, irq_can_set_affinity(virq));
+	KUNIT_EXPECT_EQ(test, desc->depth, 1);
+
+	enable_nmi(virq);
+	KUNIT_EXPECT_TRUE(test, irqd_is_started(data));
+	KUNIT_EXPECT_EQ(test, desc->depth, 0);
+
+	ret = irq_set_affinity(virq, cpumask_of(1));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	affinity = irq_data_get_effective_affinity_mask(data);
+	KUNIT_EXPECT_TRUE(test, cpumask_test_cpu(1, affinity));
+
+	ret = remove_cpu(1);
+	if (ret) {
+		KUNIT_FAIL(test, "failed to offline CPU 1: %d", ret);
+		goto out_disable_nmi;
+	}
+
+	affinity = irq_data_get_effective_affinity_mask(data);
+	KUNIT_EXPECT_FALSE(test, cpumask_test_cpu(1, affinity));
+	KUNIT_EXPECT_TRUE(test, cpumask_intersects(affinity, cpu_online_mask));
+
+	ret = add_cpu(1);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+out_disable_nmi:
+	disable_nmi_nosync(virq);
+	free_nmi(virq, NULL);
+}
+
+static void irq_nmi_migratable_invalid_test(struct kunit *test)
+{
+	int virq, ret;
+
+	virq = irq_test_setup_fake_nmi(test, &fake_nmi_irq_chip);
+	ret = request_nmi(virq, noop_handler, IRQF_NO_AUTOEN, "test_nmi", NULL);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	ret = request_nmi(virq, noop_handler,
+			  IRQF_PERCPU | IRQF_NMI_MIGRATABLE | IRQF_NO_AUTOEN,
+			  "test_nmi", NULL);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	ret = request_irq(virq, noop_handler,
+			  IRQF_NMI_MIGRATABLE, "test_irq", NULL);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	virq = irq_test_setup_fake_nmi(test, &fake_nmi_noaffinity_irq_chip);
+	ret = request_nmi(virq, noop_handler,
+			  IRQF_NMI_MIGRATABLE | IRQF_NO_AUTOEN,
+			  "test_nmi", NULL);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
 static void irq_cpuhotplug_test(struct kunit *test)
 {
 	struct irq_desc *desc;
@@ -222,6 +359,8 @@ static struct kunit_case irq_test_cases[] = {
 	KUNIT_CASE(irq_disable_depth_test),
 	KUNIT_CASE(irq_free_disabled_test),
 	KUNIT_CASE(irq_shutdown_depth_test),
+	KUNIT_CASE(irq_nmi_migratable_test),
+	KUNIT_CASE(irq_nmi_migratable_invalid_test),
 	KUNIT_CASE(irq_cpuhotplug_test),
 	{}
 };
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 9c32607f1ac3..d9f28e40affc 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -155,6 +155,8 @@ EXPORT_SYMBOL(synchronize_irq);
 #ifdef CONFIG_SMP
 cpumask_var_t irq_default_affinity;
 
+static bool irq_is_migratable_nmi(struct irq_desc *desc);
+
 static bool __irq_can_set_affinity(struct irq_desc *desc)
 {
 	if (!desc || !irqd_can_balance(&desc->irq_data) ||
@@ -599,8 +601,8 @@ int irq_setup_affinity(struct irq_desc *desc)
 	static DEFINE_RAW_SPINLOCK(mask_lock);
 	static struct cpumask mask;
 
-	/* Excludes PER_CPU and NO_BALANCE interrupts */
-	if (!__irq_can_set_affinity(desc))
+	/* Excludes PER_CPU and NO_BALANCE interrupts. */
+	if (!__irq_can_set_affinity(desc) && !irq_is_migratable_nmi(desc))
 		return 0;
 
 	guard(raw_spinlock)(&mask_lock);
@@ -1384,6 +1386,15 @@ static bool irq_supports_nmi(struct irq_desc *desc)
 	return d->chip->flags & IRQCHIP_SUPPORTS_NMI;
 }
 
+#ifdef CONFIG_SMP
+static bool irq_is_migratable_nmi(struct irq_desc *desc)
+{
+	return irq_is_nmi(desc) && desc->action &&
+	       (desc->action->flags & IRQF_NMI_MIGRATABLE) &&
+	       desc->irq_data.chip->irq_set_affinity;
+}
+#endif
+
 static int irq_nmi_setup(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
@@ -2153,7 +2164,8 @@ int request_threaded_irq(unsigned int irq, irq_handler_t handler,
 	 * Also IRQF_COND_SUSPEND only makes sense for shared interrupts and
 	 * it cannot be set along with IRQF_NO_SUSPEND.
 	 */
-	if (((irqflags & IRQF_SHARED) && !dev_id) ||
+	if ((irqflags & IRQF_NMI_MIGRATABLE) ||
+	    ((irqflags & IRQF_SHARED) && !dev_id) ||
 	    ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN)) ||
 	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
 	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
@@ -2275,8 +2287,9 @@ EXPORT_SYMBOL_GPL(request_any_context_irq);
  * An interrupt line delivering NMIs cannot be shared and IRQ handling
  * cannot be threaded.
  *
- * Interrupt lines requested for NMI delivering must produce per cpu
- * interrupts and have auto enabling setting disabled.
+ * Interrupt lines requested for NMI delivery must either produce per CPU
+ * interrupts or be migratable during CPU hotplug, and must have auto enabling
+ * disabled.
  *
  * @dev_id must be globally unique. Normally the address of the device data
  * structure is used as the cookie. Since the handler receives this value
@@ -2299,7 +2312,9 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 	if (irqflags & (IRQF_SHARED | IRQF_COND_SUSPEND | IRQF_IRQPOLL))
 		return -EINVAL;
 
-	if (!(irqflags & IRQF_PERCPU))
+	/* Exactly one NMI topology must be specified. */
+	if (!!(irqflags & IRQF_PERCPU) ==
+	    !!(irqflags & IRQF_NMI_MIGRATABLE))
 		return -EINVAL;
 
 	if (!handler)
@@ -2311,7 +2326,11 @@ int request_nmi(unsigned int irq, irq_handler_t handler,
 	    !(irqflags & IRQF_NO_AUTOEN)) ||
 	    !irq_settings_can_request(desc) ||
 	    WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
-	    !irq_supports_nmi(desc))
+	    !irq_supports_nmi(desc) ||
+	    ((irqflags & IRQF_NMI_MIGRATABLE) &&
+	     (irqd_is_per_cpu(&desc->irq_data) ||
+	      irq_settings_is_per_cpu(desc) ||
+	      !desc->irq_data.chip->irq_set_affinity)))
 		return -EINVAL;
 
 	action = kzalloc_obj(struct irqaction);
-- 
2.43.0

